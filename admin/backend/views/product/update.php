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
               
                <?php $form = ActiveForm::begin(["options" => ['enctype' => 'multipart/form-data']]) ?>


                <?= $form->field($model, 'id')->hiddenInput()->label('')?>

                <?= $form->field($model, 'product_name')->textInput(['readonly'=>true])->label('商品名称') ?>

                <?= $form->field($model, 'stock')->textInput(['readonly'=>true])->label('密码')?>
                <?= $form->field($model, 'product_image')->fileInput() ?>
                <?= $form->field($model, 'product_description')->textInput(['readonly'=>true])->label('商品描述')?>

                
                <div class="form-group">
                    <?= Html::submitButton('保存', ['class' => 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>

</div>