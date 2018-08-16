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
                                <th>账号</th>
                                <th>真实姓名</th>
                                <th>身份证号</th>
                                <th>微信openid</th>
                            </tr>
                            </thead>
                            <tbody>

                           
                            <tr>

                                <td><?=$user['username']?></td>
                                <td><?=$user['user_really_name']?></td>
                                <td><?=$user['idcard']?></td>
                                <td><?=$user['wx_openid']?></td>
                                
                            </tr>
                            
                            </tbody>
                            <thead>
                            <tr>
                                <th colspan="2">身份证照片(正)</th>
                                <th colspan="2">身份证照片(背)</th>
                            </tr>
                            </thead>
                            <tbody>

                           
                            <tr>
                                <td colspan="2" class="text-center" style="line-height:300px;">
                                <img src="data:image/png;base64,<?=$user['url1']?>" alt="" style="height: 250px;width: 150px;border-radius: 10px"></td>
                                <td colspan="2" class="text-center"style="line-height:300px;" >
                                <img src="data:image/png;base64,<?=$user['url2']?>" style="height: 250px;width: 150px;border-radius: 10px" alt=""></td>
                                
                            </tr>
                            <tr >
                                <td colspan="4" class="text-center"><a class="btn btn-primary btn-xs" href="<?=Url::toRoute(['user/edit','count'=>1,'id'=>$user['id']])?>"><i class="fa fa-edit"></i>通过</a>  <a href="<?=Url::toRoute(['user/edit','count'=>3,'id'=>$user['id']])?>" class="btn btn-warning btn-xs"><i class="fa fa-close"></i>不通过</a> </td>
                            </tr>
                            </tbody>
                        </table>
                        <!--分页-->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>