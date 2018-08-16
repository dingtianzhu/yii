<?php

namespace backend\models;

use Yii;
use backend\models\AuthAssignment;
/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property integer $role
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class Getcashrecord extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'getcashrecord';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
         return [
            // [['username','email'], 'required'],
            // //[['role', 'status', 'created_at', 'updated_at'], 'integer'],
            // [['username', 'password_hash', 'password_reset_token', 'email'], 'string', 'max' => 255],
            // [['auth_key'], 'string', 'max' => 32],
        ]; 
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            // 'product_name' => '商品名称',
            // 'stock' => '商品库存',
            // 'product_image' => '商品图片',
            // 'product_description' => '商品描述',
            'username'=>'用户账号',
            'amount'=>'提现金额',
            'creat_time'=>'申请时间',
            'finish_time'=>'审批时间',
            'user_really_name'=>'审核人员',
            'status'=>'提现状态',
            // 'pay_time'=>'支付时间',
            // 'creat_time'=>'下单时间',
        ];
    }
    //获取所有order
    public function get_all_getcashrecord(){
        $product = Yii::$app->db->createCommand('select * from getcashrecord')->queryAll();
        return $product;
    }
    //获取所有用户
   
    public function getUsergrouplist()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasMany(User::className(), ['id' => 'user_id']);
    }
    public function getUsergroup()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    public function getUsersgroup()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasOne(User::className(), ['id' => 'verify_user_id']);
    }
    // public function getProductgrouplist()
    // {
    //     /**
    //      * 第一个参数为要关联的字表模型类名称，
    //      *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
    //      */
    //     return $this->hasMany(Team::className(), ['id' => 'team_id']);
    // }
   

    

}
