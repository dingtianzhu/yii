<?php

namespace backend\controllers;
use backend\models\AuthItem;
use backend\models\Menu;
use backend\models\PasswordForm;
use yii\data\Pagination;
use backend\models\User;
use common\models\UserExt;
use backend\models\AuthAssignment;
use backend\components\Tree;
use backend\models\Family;
use backend\models\Team;
use Yii;

class UserController extends \yii\web\Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    //用户列表
    public function actionList()
    {
        $username = Yii::$app->user->identity->username;
        if (Yii::$app->request->post()) {
            if($_POST['username']!=''){
                $username = $_POST['username'];
                $data = User::find()->where(['username'=>$username]);
            }else{
                $data = User::find();
            }
            $family = Family::find();
		    $family = $family->joinWith('usergroup')->all();
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('usergroup')->joinWith('userteamgroup')->offset($pages->offset)->limit($pages->limit)->all();
            return $this->render('list',[
                'user'=>$user,
                'family'=>$family,
                'pages' => $pages
            ]);
        }
		
		$family = Family::find();
		$family = $family->joinWith('usergroup')->all();
		
        $data = User::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->joinWith('usergroup')->joinWith('userteamgroup')->offset($pages->offset)->limit($pages->limit)->all();
        return $this->render('list',[
            'user'=>$user,
            'family'=>$family,
            'pages' => $pages
        ]);
    }
    //新增用户
    public function actionCreate()
    {
        $model = new User();
        $model1 = new AuthItem();
        

        $auth = Yii::$app->authManager;
        $item = $auth->getRoles();
        $itemArr =array();
        foreach($item as $v){
            $itemArr[] .= $v->name;
        }
        foreach($itemArr as $key=>$value)
        {
            $item_one[$value]=$value;
        }
        $models=Team::find()->all();
        $arr =array();
        foreach($models as $v){
            $arr[] .= $v->team_name;
        }
        foreach($arr as $key=>$value)
        {
            $team_name[$value]=$value;
        }
        if ($model->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            
            $model->username = $post['User']['username'];

            $user = User::find()->where(['username'=>$model->username])->all();
            if(!empty($user)){
                \Yii::$app->getSession()->setFlash('error', '用户名已存在！');
                return $this->redirect(['create']);
            }

            $model->username=$post['User']['username'];
            $model->password_app=md5($post['User']['password_app']);
            $model->user_really_name=$post['User']['user_really_name'];
            $model->other_info=$post['User']['other_info'];
           
            $team_id=Team::find()->where(['team_name'=>$post['User']['team_id']])->one();
            $model->team_id = $team_id->id;
            if($post['User']['team_role']==0){
                $model->team_role=4;
            }else{
                $model->team_role=$post['User']['team_role'];
            }
            // exit;
            // $model->auth_key=$post['User']['auth_key'];
            // echo "<pre>";
            // print_r($post);
            // exit;
            
            $model->save();
            
            $status=Yii::$app->db->createCommand("insert into `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES ('".$post['User']['item_name']."','" .$model->attributes['id']."','" .time()."')")->execute();
            // $authassignment->save();
            // $role = $auth->createRole($post['User']['item_name']);//创建角色对象
            // var_dump($role);
            // exit;
            // $auth->assign($role, $user_id);//添加对应关系

            return $this->redirect(['list']);
        } else {
            return $this->render('create', [
                'model' => $model,
                'model1' => $model1,
                'item' => $item_one,
                'team_name' => $team_name
            ]);
        }
    }
    
    //更新用户
    public function actionUpdate(){
        $item_name = Yii::$app->request->get('item_name');
        $id = Yii::$app->request->get('id');
        $model = User::find()->joinWith('userteamgroup')->joinWith('usergroup')->where(['user.id' => $id])->one();
        
        $auth = Yii::$app->authManager;
        $item = $auth->getRoles();
        $itemArr =array();
        foreach($item as $v){
            $itemArr[] .= $v->name;
        }
        foreach($itemArr as $key=>$value)
        {
            $item_one[$value]=$value;
        }
        $models=Team::find()->all();
        $arr =array();
        foreach($models as $v){
            $arr[] .= $v->team_name;
        }
        foreach($arr as $key=>$value)
        {
            $team_name[$value]=$value;
        }
        
        $model1 = $this->findModel($id);

        if ($model1->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            //更新密码
            $model1->username=$post['User']['username'];
            $model1->password_app=md5($post['User']['password_app']);
            $model1->user_really_name=$post['User']['user_really_name'];
            $model1->other_info=$post['User']['other_info'];
           
            $team_id=Team::find()->where(['team_name'=>$post['User']['team_id']])->one();
            $model1->team_id = $team_id->id;
            if($post['User']['team_role']==0){
                $model1->team_role=4;
            }else{
                $model1->team_role=$post['User']['team_role'];
            }
            // exit;
            $model1->auth_key=$post['User']['auth_key'];
            
            
            $model1->save();

            //分配角色
            if(isset($post['AuthAssignment'])){
                $role = $auth->createRole($post['AuthAssignment']['item_name']); //创建角色对象
                $user_id = $id;//获取用户id
                $auth->revokeAll($user_id);
                $auth->assign($role, $user_id);//添加对应关系
            }
            return $this->redirect(['user/list']);
        }
        return $this->render('update',[
            'model' => $model,
            'item' => $item_one,
            'team_name' => $team_name
        ]);
    
    }

    public function actionAuthuser($id){
        
        if($_GET['id']!=''){
            $id = $_GET['id'];
            $data = User::find()->where(['user.id'=>$id]);
        }
        $user = $data->joinWith('usergroup')->joinWith('userteamgroup')->one();
        if($user->wx_openid!=''){
            $user->url1=file_get_contents("http://www.zeroioe.com/rffx/api/dysms_php/images/authphoto/1".$user->wx_openid);
            $user->url2=file_get_contents("http://www.zeroioe.com/rffx/api/dysms_php/images/authphoto/2".$user->wx_openid);
    
        }else{
            $user->url1='';
            $user->url2='';

        }
        
        // echo "<pre>";
        // print_r($user);
        // exit;
        return $this->render('authuser',[
            'user'=>$user,

        ]);
      
    }

    public function actionEdit($count,$id){
        // $model = User::findOne($id);
        // $model->auth_status=$count;
        // print_r($count);
        // exit;
        // $model->save();
        $status=Yii::$app->db->createCommand("update `user` set auth_status='$count'")->execute();
        return $this->redirect(['user/list']);
    }
    //删除用户



    public function actionDelete($id)
    {
        $connection=Yii::$app->db;
        $transaction=$connection->beginTransaction();
        try
        {
            $connection->createCommand()->delete("user", "id = '$id'")->execute();
            $connection->createCommand()->delete("auth_assignment", "user_id = '$id'")->execute();
            $transaction->commit();
        }
        catch(Exception $ex)
        {
            $transaction->rollBack();
        }
        return $this->redirect(['list']);
    }

    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
