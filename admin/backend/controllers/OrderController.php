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
use backend\models\Order;

use Yii;

class OrderController extends \yii\web\Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    //用户列表
    public function actionList()
    {
        // $username = Yii::$app->user->identity->username;
        if (Yii::$app->request->post()) {
            if($_POST['username']!=''){
                $username = $_POST['username'];
                $data1 = User::find()->where(['username'=>$username])->one();
                
                if($data1){
                    $data = Order::find()->where(['user_id'=>$data1->id]);
                }else{
                    \Yii::$app->getSession()->setFlash('error', 'no存在！');
                    $data = Order::find();
                }
                
            }else{
                $data = Order::find();
            }
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('usergroup')->joinWith('productgroup')->offset($pages->offset)->limit($pages->limit)->all();
            return $this->render('list',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
		$family = Family::find();
		$family = $family->joinWith('usergroup')->all();
		
        $data = Order::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->joinWith('usergroup')->joinWith('productgroup')->offset($pages->offset)->limit($pages->limit)->all();
        // print_r($user);
        // exit;
        return $this->render('list',[
            'user'=>$user,
            'family'=>$family,
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
                \Yii::$app->getSession()->setFlash('error', 'product已存在！');
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
    //删除用户
    public function actionDelete($id)
    {
        $connection=Yii::$app->db;

        $connection->createCommand()->delete("orders", "id = '$id'")->execute();

        return $this->redirect(['list']);
    }

    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
