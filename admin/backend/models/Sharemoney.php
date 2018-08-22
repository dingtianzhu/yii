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
class Sharemoney extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_sharemoney';
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
            'username' => '用户账号',
            'user_really_name' => '用户姓名',
            'team_name' => '所属团队',
            'amount' => '金额',
            'info' => '分红备注',
            'creat_time' => '分红时间',

        ];
    }
    //获取所有用户
    public function get_all_user_sharemoney(){
        $team = Yii::$app->db->createCommand('select * from team')->queryAll();
        return $team;
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
    public function getTeamgroup()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasOne(Team::className(), ['id' => 'team_id']);
    }
    public function getUsersgroup()
    {
        /**
         * 第一个参数为要关联的字表模型类名称，
         *第二个参数指定 通过子表的 customer_id 去关联主表的 id 字段
         */
        return $this->hasOne(User::className(), ['id' => 'new_user_id'])->from(['alias' => User::tableName()]);
    }

    

}
