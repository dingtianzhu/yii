<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;
$this->title = '订单列表';
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
                        <a class="btn btn-info btn-sm" href="<?= Url::toRoute('user/create')?>">新增用户</a>
                    </div>
                    <div class="col-sm-3 pull-right">
                        <form action="<?=Url::toRoute('order/list')?>" method="post">
                            <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->getRequest()->getCsrfToken();?>" />
                            <div class="input-group">
                                <input type="text" placeholder="请输入用户名或工号" name="username" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
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
                                <th>帐号</th>
                                <th>商品名称</th>
                                <th>下单时间</th>
                                <th>支付时间</th>
                                <th>订单状态</th>
                                <th>使用状态</th>
                                <th>商品单价</th>
                                <th>数量</th>
                                <th>总金额</th>
                                <!-- <th>操作</th> -->
                            </tr>
                            </thead>
                            <tbody>

                            <?php foreach($user as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['usergroup']['username']?></td>
                                    <td><?=$vo['productgroup']['product_name']?></td>
                                    <td><?=$vo['creat_time']?></td>
                                    <td><?=$vo['pay_time']?></td>
                                    <td><?php switch($vo['status']){case 1:echo '已支付';break;case 2:echo '未支付';break;}?></td>
                                    <td><?=$vo['use_status']?></td>
                                    <td><?=$vo['price']?></td>
                                    <td><?=$vo['number']?></td>
                                    <td><?=$vo['total_price']?></td>
                                    <!-- <td><a class="btn btn-primary btn-xs" href="<?=Url::toRoute(['order/update','id'=>$vo['id']])?>"><i class="fa fa-edit"></i>编辑</a>  <a href="<?=Url::toRoute(['order/delete','id'=>$vo['id']])?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i>删除</a></td> -->
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                        <!--分页-->
                        <div class="f-r">
                            <?= LinkPager::widget([
                                'pagination'=>$pages,
                                'firstPageLabel' => '首页',
                                'nextPageLabel' => '下一页',
                                'prevPageLabel' => '上一页',
                                'lastPageLabel' => '末页',
                            ]) ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>