<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\widgets\LinkPager;
$this->title = '用户列表';
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
                                <th>序号</th>
                                <th>帐号</th>
                                <th>真实姓名</th>
                                <th>地址</th>
                                <th>所属团队</th>
                                <th>团队角色</th>
                                <th>认证状态</th>
                                <th>用户组</th>
                                <th>提现信息</th>
>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <?php foreach($user as $vo):?>
                                <tr>
                                    <td><?=$vo['id']?></td>
                                    <td><?=$vo['username']?></td>
                                    <td><?=$vo['user_really_name']?></td>
                                    <td><?=$vo['other_info']?></td>
                                    <td><?=$vo['userteamgroup']['team_name']?></td>
                                    <td><?php switch($vo['team_role']){case 1:echo '团长';break;case 2:echo '稽查';break;case 3:echo '审计';break;case 4:echo '团员';break;case 5:echo '会员';break;case 6:echo '待审核';break;}?></td>
                                    <td><?php switch($vo['auth_status']){case 1:echo '已认证';break;case 2:echo '认证中';break;case 3:echo '认证失败';break;case 4:echo '未认证';break;}?></td></td>
                                    <td><?=$vo['usergroup']['item_name']?></td>
                                    <td>姓名:<?=$vo['bankgroup']['user_name']?>
                                    银行名:<?=$vo['bankgroup']['bank_name']?>
                                    支行名:<?=$vo['bankgroup']['bank_address']?>
                                    卡号:<?=$vo['bankgroup']['bank_cardid']?></td>
                                    <td><a class="btn btn-primary btn-xs" href="<?=Url::toRoute(['user/update','item_name'=>$vo['usergroup']['item_name'],'id'=>$vo['id']])?>"><i class="fa fa-edit"></i>编辑</a>  <?php if($vo['username'] !='admin'):?><a href="<?=Url::toRoute(['user/delete','id'=>$vo['id']])?>" class="btn btn-default btn-xs"><i class="fa fa-close"></i>删除</a> <a class="btn btn-success btn-xs" href="<?=Url::toRoute(['user/authuser','item_name'=>$vo['usergroup']['item_name'],'id'=>$vo['id']])?>">审核认证</a><?php endif;?> </td>
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