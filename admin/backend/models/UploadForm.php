<?php
namespace app\models;
 
use yii\base\Model;
use yii\web\UploadedFile;
 
/**
* UploadForm is the model behind the upload form.
*/
class UploadForm extends Model
{
    /**
    * @var UploadedFile file attribute
    */
    public $file;
    public $product_image;
 
    /**
    * @return array the validation rules.
    */
    public function rules()
    {
        return [
            [['product_image'],'file'],
        ];
    }
}


?>
