<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\Alert;
$this->title = '分红列表';
$this->params['breadcrumbs'][] = $this->title;
if( Yii::$app->getSession()->hasFlash('success') ) {
    echo Alert::widget([
        'options' => [
            'class' => 'alert-success', //这里是提示框的class
        ],
        'body' => Yii::$app->getSession()->getFlash('success'), //消息体
    ]);
}
if( Yii::$app->getSession()->hasFlash('error') ) {
    echo Alert::widget([
        'options' => [
            'class' => 'alert-error',
        ],
        'body' => Yii::$app->getSession()->getFlash('error'),
    ]);
}
?>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <h1><?= Html::encode($this->title) ?></h1>
                    <div class="row">
                    <div class="col-sm-3">
                        <!-- <a class="btn btn-info btn-sm" href="<?= Url::toRoute('getcashrecord/create')?>">新增用户</a> -->
                    </div>
                    <div class="col-sm-3 pull-right">
                        <form action="<?=Url::toRoute('getcashrecord/list')?>" method="post">
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
                                <th>用户姓名</th>
                                <th>所属团队</th>
                                <th>金额</th>
                                <th>分红备注</th>
                                <th>分红时间</th>
                                <th>入团会员账号姓名</th>
                            </tr>
                            </thead>
                            <tbody>
                            <div class="alert-error"></div>
                            <?php foreach($user as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['usergroup']['username']?></td>
                                    <td><?=$vo['usergroup']['user_really_name']?></td>
                                    <td><?=$vo['teamgroup']['team_name']?></td>
                                    <td><?=$vo['amount']?></td>
                                    <td><?=$vo['info']?></td>
                                    <td><?= date('Y-m-d H:i:s',$vo['creat_time'])?></td>
                                    <td>账号:<?=$vo['usersgroup']['username']?>姓名:<?=$vo['usersgroup']['user_really_name']?></td>
                                    
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