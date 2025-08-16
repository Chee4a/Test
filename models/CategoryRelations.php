<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category_relations".
 *
 * @property int $id
 * @property int|null $parent_id
 * @property int|null $child_id
 *
 * @property ApplicationPosition[] $applicationPositions
 * @property Category $child
 * @property Category $parent
 */
class CategoryRelations extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category_relations';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'child_id'], 'integer'],
            [['child_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::class, 'targetAttribute' => ['child_id' => 'id']],
            [['parent_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::class, 'targetAttribute' => ['parent_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'child_id' => 'Child ID',
        ];
    }

    /**
     * Gets query for [[ApplicationPositions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getApplicationPositions()
    {
        return $this->hasMany(ApplicationPosition::class, ['category_relations_id' => 'id']);
    }

    /**
     * Gets query for [[Child]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getChild()
    {
        return $this->hasOne(Category::class, ['id' => 'child_id']);
    }

    /**
     * Gets query for [[Parent]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getParent()
    {
        return $this->hasOne(Category::class, ['id' => 'parent_id']);
    }
}
