<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property int $id
 * @property string $title
 *
 * @property ApplicationCategory[] $applicationCategories
 * @property CategoryRelations[] $categoryRelations
 * @property CategoryRelations[] $categoryRelations0
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
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
        return $this->hasMany(ApplicationCategory::class, ['category_id' => 'id']);
    }

    /**
     * Gets query for [[CategoryRelations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryRelations()
    {
        return $this->hasMany(CategoryRelations::class, ['child_id' => 'id']);
    }

    /**
     * Gets query for [[CategoryRelations0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryRelations0()
    {
        return $this->hasMany(CategoryRelations::class, ['parent_id' => 'id']);
    }
}
