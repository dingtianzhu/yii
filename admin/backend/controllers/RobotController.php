<?php

namespace backend\controllers;
use backend\models\AuthItem;
use backend\models\Menu;
use backend\models\PasswordForm;
use yii\data\Pagination;
use backend\models\Family;
use backend\models\Robot;
use backend\models\User;
use common\models\UserExt;
use backend\models\AuthAssignment;
use backend\components\Tree;

use Yii;

class RobotController extends \yii\web\Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    //家庭列表
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
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->joinWith('usergroup')->offset($pages->offset)->limit($pages->limit)->all();
            return $this->render('list',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
        $data = Robot::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);

        $user = $data->joinWith('usergroup')->offset($pages->offset)->limit($pages->limit)->all();
        return $this->render('list',[
            'user'=>$user,
            'pages' => $pages
        ]);
    }
	//新增机器人
    public function actionCreate()
    {
        $model = new Robot();
       /*  $model1 = new AuthItem();
        $auth = Yii::$app->authManager;
        $item = $auth->getRoles();
        $itemArr =array();
        foreach($item as $v){
            $itemArr[] .= $v->name;
        }
        foreach($itemArr as $key=>$value)
        {
            $item_one[$value]=$value;
        } */

        if ($model->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            $model->number = $post['Robot']['number'];
            $model->mac = $post['Robot']['mac'];

            $user = Robot::find()->where(['number'=>$model->number])->all();
            if(!empty($user)){
                \Yii::$app->getSession()->setFlash('error', '机器人编号已存在！');
                return $this->redirect(['create']);
            }
            $model->save();
            $user_id = $model->attributes['id']; //获取插入后id
 
            return $this->redirect(['list']);
        } else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

}
