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
        var_dump($title);
        var_dump($content);
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

        var_dump($test);

        return $test;
    }

    public function getArticles()
    {
        $query = $this->connexion->prepare('
                                    SELECT
                                        *
                                    FROM 
                                        articles');
        $query->execute();

        $articles = $query->fetchAll();

        return $articles;
    }

    public function getArticleById($id_article)
    {
        $query = $this->connexion->prepare('
                                    SELECT
                                        *
                                    FROM 
                                        articles
                                    WHERE
                                        id_article = ?');
        $query->execute([$id_article]);

        $article = $query->fetch();

        return $article;
    }
}
