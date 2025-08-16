<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "application_position".
 *
 * @property int $id
 * @property int|null $category_relations_id
 * @property int $application_id
 * @property string $position_date
 * @property int $position
 *
 * @property Application $application
 * @property CategoryRelations $categoryRelations
 */
class ApplicationPosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'application_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_relations_id', 'application_id', 'position'], 'integer'],
            [['application_id', 'position_date', 'position'], 'required'],
            [['position_date'], 'safe'],
            [['application_id'], 'exist', 'skipOnError' => true, 'targetClass' => Application::class, 'targetAttribute' => ['application_id' => 'id']],
            [['category_relations_id'], 'exist', 'skipOnError' => true, 'targetClass' => CategoryRelations::class, 'targetAttribute' => ['category_relations_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_relations_id' => 'Category Relations ID',
            'application_id' => 'Application ID',
            'position_date' => 'Position Date',
            'position' => 'Position',
        ];
    }

    /**
     * Gets query for [[Application]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getApplication()
    {
        return $this->hasOne(Application::class, ['id' => 'application_id']);
    }

    /**
     * Gets query for [[CategoryRelations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryRelations()
    {
        return $this->hasOne(CategoryRelations::class, ['id' => 'category_relations_id']);
    }
}
