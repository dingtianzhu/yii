<?php

namespace backend\controllers;
use backend\models\AuthItem;
use backend\models\Menu;
use backend\models\PasswordForm;
use yii\data\Pagination;
use backend\models\Family;
use backend\models\User;
use common\models\UserExt;
use backend\models\AuthAssignment;
use backend\components\Tree;

use Yii;

class FamilyController extends \yii\web\Controller
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
        $data = Family::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
		
		$data2= User::find();
        $user2 = $data2->joinWith('usergroup')->all();
		
        $user = $data->joinWith('usergroup')->offset($pages->offset)->limit($pages->limit)->all();
        return $this->render('list',[
            'user'=>$user,
            'user2'=>$user2,
            'pages' => $pages
        ]);
    }

}
