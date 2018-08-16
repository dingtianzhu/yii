<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\AuthItem */

$this->title = '更新团队';
?>
<div class="wrapper wrapper-content">
    <div class="ibox-content">
        <div class="row pd-10">
            <h1><?= Html::encode($this->title) ?></h1>
            <hr>
            <div class="auth-item-form col-sm-4">
                <?php $form = ActiveForm::begin(); ?>

                <?= $form->field($model, 'id')->hiddenInput()->label('')?>

                <?= $form->field($model, 'team_name')->textInput(['readonly'=>false])->label('团队名称') ?>
                <?= $form->field($model, 'team_leader_id')->textInput(['readonly'=>true])->label('团长id') ?>

                <?= $form->field($model, 'status')->textInput(['readonly'=>false])->label('团队状态') ?>

               <!--  -->
                <div class="form-group">
                    <?= Html::submitButton('保存', ['class' => 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>

</div>