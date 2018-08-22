<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;
$this->title = '商品使用状态';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <h1><?= Html::encode($this->title) ?></h1>
                    <div class="row">
                    <div class="col-sm-3">
                        <a class="btn btn-info btn-sm" href="<?= Url::toRoute('product/create')?>">新增商品</a>
                    </div>
                    <div class="col-sm-3 pull-right">
                        <form action="<?=Url::toRoute('product/list')?>" method="post">
                            <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->getRequest()->getCsrfToken();?>" />
                            <div class="input-group">
                                <input type="text" placeholder="请输入商品名称" name="product_name" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索商品</button> </span>
                            </div>
                        </form>
                    </div>
                    </div>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>商品名称</th>
                                <th>用户账号</th>
                                <th>商品图片</th>
                                <th>使用状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php foreach($status as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['product_name']?></td>
                                    <td><?=$vo['username']?></td>
                                    <td><img src="<?=$vo['product_image']?>" style="height: 50px;width: 50px;border-radius: 10px"></td>
                                    
                                    <td><?=$vo['use_status']?></td>
                               
                                        <td><a class="btn btn-primary btn-xs" href="<?=Url::toRoute(['product/update','id'=>$vo['id']])?>"><i class="fa fa-edit"></i>编辑</a>  <a href="<?=Url::toRoute(['product/delete','id'=>$vo['id']])?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i>删除</a></td>
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                        <!--分页-->
                        <div class="f-r">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>