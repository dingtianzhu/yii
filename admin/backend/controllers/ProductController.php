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
use backend\models\Product;

use app\models\UploadForm;
use yii\web\UploadedFile;


use Yii;

class ProductController extends \yii\web\Controller
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
            if($_POST['product_name']!=''){
                $product_name = $_POST['product_name'];
                $data = Product::find()->where(['product_name'=>$product_name]);
            }else{
                $data = Product::find();
            }
            $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
            $user = $data->offset($pages->offset)->limit($pages->limit)->all();
            return $this->render('list',[
                'user'=>$user,
                'pages' => $pages
            ]);
        }
		// $family = Family::find();
		// $family = $family->joinWith('usergroup')->all();
		
        $data = Product::find();
        $pages = new Pagination(['totalCount' =>$data->count(), 'pageSize' => '20']);
        $user = $data->offset($pages->offset)->limit($pages->limit)->all();
        return $this->render('list',[
            'user'=>$user,
            // 'family'=>$family,
            'pages' => $pages
        ]);
    }
    //新增用户
    public function actionCreate()
    {
        $model = new Product();
       
        if ($model->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            $models = new UploadForm();
            $models->file = UploadedFile::getInstance($model, 'product_image');
    
            if ($models->file && $models->validate()) {
                $path='/web/product/'.time().rand(10000,900000).'.' . $models->file->extension;
                $pathweb='..'.$path;
                if(empty($models->file->saveAs($pathweb))){
                    \Yii::$app->getSession()->setFlash('error', 'image error！');
                    return $this->redirect(['create']);
                }
                // echo "<pre>";
                // print_r($models);
                // exit;
            }
            
            $model->product_name=$post['Product']['product_name'];
            $model->stock=$post['Product']['stock'];
            $model->product_image=Yii::$app->request->getHostInfo().'/rffx/admin/backend'.$path;


            $model->product_description=$post['Product']['product_description'];
            $product = Product::find()->where(['product_name'=>$model->product_name])->all();
            if(!empty($product)){
                \Yii::$app->getSession()->setFlash('error', 'product已存在！');
                return $this->redirect(['create']);
            }
            $model->save();
            $product_id = $model->attributes['id'];

           
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
        $model = Product::find()->where(['product.id' => $id])->one();
       
        $model1 = $this->findModel($id);
        
        if ($model1->load(Yii::$app->request->post())) {
            $post = Yii::$app->request->post();
            $models = new UploadForm();
            $models->file = UploadedFile::getInstance($model, 'product_image');
    
            if ($models->file && $models->validate()) {
                $path='/web/product/'.time().rand(10000,900000).'.' . $models->file->extension;
                $pathweb='..'.$path;
                if(empty($models->file->saveAs($pathweb))){
                    $model1->product_name=$post['Product']['product_name'];
                    $model1->stock=$post['Product']['stock'];
                    // $model1->product_image=Yii::app()->request->getHostInfo().$path;


                    $model1->product_description=$post['Product']['product_description'];
                
                    $model1->save();
                
                    return $this->redirect(['product/list']);
                }
            }

            $model1->product_name=$post['Product']['product_name'];
            $model1->stock=$post['Product']['stock'];
            $model1->product_image=Yii::$app->request->getHostInfo().'/rffx/admin/backend'.$path;


            $model1->product_description=$post['Product']['product_description'];
           
            $model1->save();
           
            return $this->redirect(['product/list']);
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

        $connection->createCommand()->delete("product", "id = '$id'")->execute();

        return $this->redirect(['list']);
    }

    public function actionStatus(){
        $model=new Product();
        $status=Yii::$app->db->createCommand('select user.username,orders.id,orders.use_status,product.product_name,product.product_image from user,orders,product where product.id=orders.product_id and user.id=orders.user_id')->queryAll();
        // $pages = new Pagination(['totalCount' =>$status->count(), 'pageSize' => '20']);
        return $this->render('status',[
            'status'=>$status,
            'model'=>$model,
            // 'pages'=>$pages
        ]);

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
