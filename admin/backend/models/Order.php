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
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'orders';
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
            'product_name' => '商品名称',
            // 'stock' => '商品库存',
            // 'product_image' => '商品图片',
            // 'product_description' => '商品描述',
            'username'=>'用户账号',
            'total_price'=>'订单总金额',
            'number'=>'数量',
            'price'=>'商品单价',
            'use_status'=>'用户商品使用状态',
            'status'=>'订单状态',
            'pay_time'=>'支付时间',
            'creat_time'=>'下单时间',
        ];
    }
    //获取所有order
    public function get_all_order(){
        $product = Yii::$app->db->createCommand('select * from orders')->queryAll();
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
    public function getProductgroup()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }
    public function getProductgrouplist()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasMany(Product::className(), ['id' => 'product_id']);
    }
   

    

}
