<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\AuthItem */

$this->title = '更新用户 ';
?>
<div class="wrapper wrapper-content">
    <div class="ibox-content">
        <div class="row pd-10">
            <h1><?= Html::encode($this->title) ?></h1>
            <hr>
            <div class="auth-item-form col-sm-4">
                <?php $form = ActiveForm::begin(); ?>

                <?= $form->field($model, 'id')->hiddenInput()->label('')?>

                <?= $form->field($model, 'username')->textInput(['readonly'=>true])->label('帐号') ?>
                <?= $form->field($model, 'user_really_name')->textInput(['readonly'=>false])->label('真实姓名') ?>
                <?= $form->field($model, 'password_app')->passwordInput(['value'=>''])->label('密码')?>
                <?= $form->field($model, 'other_info')->textInput(['readonly'=>false])->label('地址') ?>
                <?= $form->field($model, 'team_id')->dropDownList($team_name)->label('所属团队') ?>
                
                <?= $form->field($model, 'team_role' )->dropDownList(['请选择团队角色,默认团员','团长','稽查','审计','团员','会员','待审核'])->label('团队角色')?>
                
                <?= $form->field($model, 'auth_key')->hiddenInput()->label(false)?>
                <?php if($model->username =='admin'):?>
                    <?= $form->field($model->usergroup, 'item_name' )->dropDownList($item,['disabled'=>true])->label('用户组')?>
                <?php else:?>
                    <?= $form->field($model->usergroup, 'item_name' )->dropDownList($item)->label('用户组')?>
                <?php endif;?>
                <div class="form-group">
                    <?= Html::submitButton('保存', ['class' => 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>

</div>