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

    <?= $form->field($model, 'team_name')->textInput(['maxlength' => true]) ?>
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



    <?= $form->field($model, 'status')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord ? 'btn btn-primary' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
