<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class Articles extends DataBase
{
    private $connexion;

    public function __construct()
    {
        $this->connexion = $this->getConnexion();
    }

    public function insertArticle($title, $content, $imageSrc, $imageAlt)
    {
        $query = $this->connexion->prepare('
                                            INSERT INTO `articles`(
                                                `title`,
                                                date_create,
                                                `content`)
                                            VALUES(
                                                ?,
                                                NOW(),
                                                ?)
                                            ');

        $test[] = $query->execute([$title, $content]);

        $id_article = $this->connexion->lastInsertId();

        $query2 = $this->connexion->prepare('
                                            INSERT INTO images(
                                                image_src,
                                                image_alt,
                                                id_article)
                                            VALUES(
                                                ?,
                                                ?,
                                                ?)
                                            ');
        $test[] = $query2->execute([$imageSrc, $imageAlt, $id_article]);

        return $test;
    }

    public function updateArticle($idArticle, $title, $content, $newImageSrc, $imageAlt)
    {
        $query = $this->connexion->prepare('
                                            UPDATE
                                                articles
                                            SET
                                                title = ?,
                                                content = ?
                                            WHERE
                                                id_article = ?
                                            ');
        $test[] = $query->execute([$title, $content, $idArticle]);

        $query = $this->connexion->prepare('
                                            UPDATE
                                                images
                                            SET
                                                image_src = ?,
                                                image_alt = ?
                                            WHERE
                                                id_article = ?
                                                ');
        $test[] = $query->execute([$newImageSrc, $imageAlt, $idArticle]);

        return $test;
    }

    public function delArticle($idArticle)
    {
        $query = $this->connexion->prepare('
                                            DELETE FROM
                                                articles
                                            WHERE
                                                id_article = ?
                                            ');
        $test = $query->execute([$idArticle]);

        return $test;
    }

    public function getArticles()
    {
        $query = $this->connexion->prepare('
                                    SELECT
                                        articles.id_article,
                                        title,
                                        date_create,
                                        content,
                                        image_src,
                                        image_alt
                                    FROM 
                                        articles
                                    INNER JOIN images ON articles.id_article = images.id_article
                                    ORDER BY date_create DESC
                                    ');
        $query->execute();

        $articles = $query->fetchAll();

        return $articles;
    }

    public function getArticleById($id_article)
    {
        $query = $this->connexion->prepare('
                                            SELECT
                                                articles.id_article,
                                                `title`,
                                                date_create,
                                                `content`,
                                                image_src,
                                                image_alt
                                            FROM
                                                `articles`
                                            INNER JOIN images ON articles.id_article = images.id_article
                                            WHERE
                                                articles.id_article = ?');
        $query->execute([$id_article]);

        $article = $query->fetch();

        return $article;
    }

    public function searchArticle($search)
    {
        $query = $this->connexion->prepare('
                                            SELECT
                                                `id_article`,
                                                `title`,
                                                date_create,
                                                `content`
                                            FROM
                                                articles
                                            WHERE `title` LIKE ?
                                            ');
        $query->execute(['%' . $search . '%']);

        $searchResult = $query->fetchAll();

        return $searchResult;
    }
}
