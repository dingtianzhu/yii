<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\bootstrap\Alert;
/* @var $this yii\web\View */
/* @var $model backend\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>
    <?php
    if( Yii::$app->getSession()->hasFlash('error') ) {
        echo Alert::widget([
            'options' => [
                'class' => 'alert alert-danger',
            ],
            'body' => Yii::$app->getSession()->getFlash('error'),
        ]);
    }
    ?>
    <?= $form->field($model, 'user_really_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password_app')->passwordInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'other_info')->textInput(['maxlength' => true])->label('地址') ?>
    <?= $form->field($model, 'team_id')->dropDownList($team_name)->label('所属团队') ?>
    <?= $form->field($model, 'team_role' )->dropDownList(['请选择团队角色,默认团员','团长','稽查','审计','团员','会员','待审核'])->label('团队角色')?>

    
    <?= $form->field($model, 'item_name' )->dropDownList($item)->label('用户组')?>
    
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord ? 'btn btn-primary' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
