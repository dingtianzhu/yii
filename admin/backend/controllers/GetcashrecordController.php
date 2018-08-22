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
use backend\models\Getcashrecord;
use backend\models\Team;
use backend\models\Sharemoney;
use yii\bootstrap\Alert;
use Yii;

class GetcashrecordController extends \yii\web\Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    //用户列表
    public function actionList()
    {
        
        if (Yii::$app->request->post()) {
            if($_POST['username']!=''){
                $username = $_POST['username'];
                $data = Getcashrecord::find()->where(['username'=>$username]);
                
            }else{
                $data = Getcashrecord::find();
            }
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('usergroup')->offset($pages->offset)->limit($pages->limit)->all();   
            
            
            return $this->render('list',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
		
        $data = Getcashrecord::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->joinWith('usergroup')->offset($pages->offset)->limit($pages->limit)->all();   
        
        return $this->render('list',[
            'user'=>$user,
            
            'pages' => $pages
        ]);
    }
    public function actionSharemoneylist()
    {
        
        if (Yii::$app->request->post()) {
            if($_POST['username']!=''){
                $username = $_POST['username'];
                $data = Sharemoney::find()->where(['username'=>$username]);
                
            }else{
                $data = Sharemoney::find();
            }
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('usergroup')->joinWith('usersgroup')->joinWith('teamgroup')->offset($pages->offset)->limit($pages->limit)->all();  
            
            return $this->render('sharemoneylist',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
		
        $data = Sharemoney::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->joinWith('usergroup')->joinWith('usersgroup')->joinWith('teamgroup')->offset($pages->offset)->limit($pages->limit)->all();   
        
        return $this->render('sharemoneylist',[
            'user'=>$user,
            
            'pages' => $pages
        ]);
    }
    //新增用户
    public function actionCreate()
    {
        $model = new Team();
       

        if ($model->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            $model->team_name = $post['Team']['team_name'];
            $model->status = $post['Team']['status'];
            // $model->mac = $post['Robot']['mac'];

            $team = Team::find()->where(['team_name'=>$model->team_name])->all();
            if(!empty($team)){
                // Yii::$app->getSession()->setFlash('error', 'product已存在！');

                Yii::$app->getSession()->setFlash('error', '保存失败');
                
                return $this->redirect(['create']);
            }
            $model->save();
            $team_id = $model->attributes['id']; //获取插入后id
 
            return $this->redirect(['list']);
        } else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
       
    }

    //更新用户
    public function actionUpdate(){
        // $item_name = Yii::$app->request->get('item_name');
        $id = Yii::$app->request->get('id');
        $model = Product::find()->where(['team.id' => $id])->one();
       
        $model1 = $this->findModel($id);

        if ($model1->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();


            $model1->team_name=$post['Team']['team_name'];


            $model1->status=$post['Team']['status'];
           
            $model1->save();
           
            return $this->redirect(['team/list']);
        }else{
            echo 'ddd';
        }
        return $this->render('update',[
            'model' => $model,
            // 'item' => $item_one
        ]);
    }

    public function actionUserbalance(){
        if (Yii::$app->request->post()) {
            if($_POST['username']!=''){
                $username = $_POST['username'];
                $data = User::find()->where(['username'=>$username]);
                // $data = Order::find()->where(['user_id'=>$data['id']]);
                // print_r($data);
                // exit;
            }else{
                $data = User::find();
            }
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('userteamgroup')->offset($pages->offset)->limit($pages->limit)->all();
            return $this->render('userbalance',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
		// $family = Family::find();
		// $family = $family->joinWith('usergroup')->all();
		
        $data = User::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->joinWith('userteamgroup')->offset($pages->offset)->limit($pages->limit)->all();
        // print_r($user);
        // exit;
        return $this->render('userbalance',[
            'user'=>$user,
            // 'family'=>$family,
            'pages' => $pages
        ]);
    }
    public function actionSetamount(){
        if(Yii::$app->request->get('id')){
            $id=Yii::$app->request->get('id');
            $amount = Yii::$app->request->get('amount');
            $data = Getcashrecord::find()->where(['id'=>$id])->one();
            $uid = $data->user_id;
            $user = User::find()->where(['id'=>$uid])->one();
            $freeze_balance = $user->freeze_balance - $amount;
            if($freeze_balance<0){
                \Yii::$app->getSession()->setFlash('error', '余额不足！');

                return $this->redirect(['getcashrecord/list']);
                
            }
            
            
            $connection = Yii::$app->db;
            
            $transaction = $connection->beginTransaction();
            try
            {
                $models = User::findOne($uid);
                $models->freeze_balance=$freeze_balance;
                $model = Getcashrecord::findOne($id);
                $model->status=3;
                $models->save();
                $model->save(); 
                $transaction->commit();
            }
            catch(Exception $e)
            {
                $transaction->rollBack();
            }
            return $this->redirect(['getcashrecord/list']);
        }
    }
    //删除用户
    public function actionDelete($id)
    {
        $connection=Yii::$app->db;

        $connection->createCommand()->delete("getcashrecord", "id = '$id'")->execute();

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
