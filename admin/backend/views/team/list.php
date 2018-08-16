<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;
$this->title = '团队列表';
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
                        <a class="btn btn-info btn-sm" href="<?= Url::toRoute('team/create')?>">新增团队</a>
                    </div>
                    <div class="col-sm-3 pull-right">
                        <form action="<?=Url::toRoute('team/list')?>" method="post">
                            <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->getRequest()->getCsrfToken();?>" />
                            <div class="input-group">
                                <input type="text" placeholder="团队名" name="teamname" class="input-sm form-control"> <span class="input-group-btn">
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
                                <th>团队名称</th>
                                <th>团员账号</th>
                                <th>团长</th>

                                
                                <th>创建时间</th>
                                <th>团队状态</th>
                                <th>团队人数</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php foreach($user as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['team_name']?></td>
                                    <td><?=$vo['usergroup']['username']?></td>
                                    <td><?=$vo['usergroup']['user_really_name']?></td>
                                    <td><?=date('Y-m-d H:i:s',$vo['creat_time'])?></td>
                                    <td><?php switch($vo['status']){case 1:echo '申请中';break;case 2:echo '正常';break;case 3:echo '冻结';break;}?></td>
                                    <td><?=$vo['count']?></td>
                                    <td><a class="btn btn-primary btn-xs" href="<?=Url::toRoute(['team/teaminfo','id'=>$vo['id']])?>"><i class="fa fa-edit"></i>查看</a> </td>
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