<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;

$this->title = '机器人信息列表';
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
                       <a class="btn btn-info btn-sm" href="<?= Url::toRoute('robot/create')?>">新增机器人</a>
                    </div>
                    <div class="col-sm-3 pull-right">
                        <form action="<?=Url::toRoute('user/list')?>" method="post">
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
                                <th>id</th>
                                <th>机器人编号</th>
                                <th>机器人mac</th>
								<th>昵称</th>
								<th>性别</th>
								<th>音量</th>
								<th>网络连接信息</th>
								<th>家庭名称</th>
								<th>绑定状态</th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php foreach($user as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['number']?></td>
                                    <td><?=$vo['mac']?></td>
                                    <td><?=$vo['info']?></td>
									<td><?php if($vo['sex'] =='1'):?>公<?php else: ?>母<?php endif;?></td>
									<td><?=$vo['voice']?></td>
									<td><?=$vo['network']?></td>								
									<td><?=$vo['usergroup']['name']?></td>
									<td><?php if($vo['usergroup']['name'] !=''):?>已绑定<?php else: ?>未绑定<?php endif;?></td>
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
