<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\bootstrap\Alert;
/* @var $this yii\web\View */
/* @var $model backend\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(["options" => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($model, 'product_name')->textInput(['maxlength' => true]) ?>
    


    <?= $form->field($model, 'product_image')->fileInput() ?>
    <?= $form->field($model, 'stock')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'product_description')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord ? 'btn btn-primary' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
