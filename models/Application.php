<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "application".
 *
 * @property int $id
 * @property string $title
 *
 * @property ApplicationCategory[] $applicationCategories
 * @property ApplicationPosition[] $applicationPositions
 */
class Application extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'application';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['title'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
        ];
    }

    /**
     * Gets query for [[ApplicationCategories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getApplicationCategories()
    {
        return $this->hasMany(ApplicationCategory::class, ['application_id' => 'id']);
    }

    /**
     * Gets query for [[ApplicationPositions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getApplicationPositions()
    {
        return $this->hasMany(ApplicationPosition::class, ['application_id' => 'id']);
    }
}
