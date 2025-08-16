<?php

namespace app\modules\ApplicationTopCategoryPositions\controllers;

use Yii;
use yii\web\Controller;
use yii\web\Response;

class DefaultController extends Controller
{
    public function actionIndex()
    {

        Yii::$app->response->format = Response::FORMAT_JSON;

        $date = Yii::$app->request->get('date');

        if (!$this->isValidDate($date)) {
            return [
                'status_code' => 400,
                'error' => 'Неверный формат даты. Используйте YYYY-MM-DD',
            ];
        }

        $data = $this->getPositions($date);

        Yii::info("Request for date: $date", 'appTopCategory');
        
        return [
            'status_code' => 200,
            'message' => 'ok',
            'data' => $data
        ];
    }

    private function isValidDate($date)
    {
        return preg_match('/^\d{4}-\d{2}-\d{2}$/', $date) && date_create($date) !== false;
    }

    private function getPositions($date)
    {
        $rows = Yii::$app->db->createCommand("
            SELECT
                c.title AS category,
                MIN(ap.position) AS position
            FROM application_position ap
            INNER JOIN category_relations cr ON cr.id = ap.category_relations_id
            INNER JOIN category c ON c.id = cr.parent_id
            WHERE
                ap.application_id = :appId
                AND ap.position_date = :date
            GROUP BY cr.parent_id, c.title
        ", [
            ':appId' => 1421444,
            ':date' => $date,
        ])->queryAll();

        $result = [];
        foreach ($rows as $row) {
            $result[$row['category']] = (int) $row['position'];
        }

        return $result;
    }
}
