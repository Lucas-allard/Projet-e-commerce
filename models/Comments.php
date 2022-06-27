<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class Comments extends DataBase
{
  private $connexion;

  public function __construct()
  {
    $this->connexion = $this->getConnexion();
  }

  public function insertComment($lastName, $name, $content, $idArticle)
  {
    $query = $this->connexion->prepare('
                                        INSERT INTO `comments`(
                                          `last_name`,
                                          name,
                                          `date_create`,
                                          `content`,
                                          `id_article`
                                        )
                                        VALUES(
                                            ?,
                                            ?,
                                            NOW(),
                                            ?,
                                            ?
                                        )
                                        ');

    $test = $query->execute([$lastName, $name, $content, $idArticle]);

    return $test;
  }

  public function getComments()
  {
    $query = $this->connexion->prepare('
                                        SELECT
                                          `last_name`,
                                          `name`,
                                          `date_create`,
                                          `content`
                                        FROM
                                          comments
                                        ORDER BY 
                                          date_create DESC
                                      ');

    $query->execute();

    $comments = $query->fetchAll();

    return $comments;
  }

  public function getCommentsById($idArticle)
  {
    $query = $this->connexion->prepare('
                                        SELECT
                                          `last_name`,
                                          `name`,
                                          `date_create`,
                                          `content`
                                        FROM
                                          comments
                                        WHERE
                                          id_article = ?
                                        ORDER BY 
                                          date_create DESC
                                      ');

    $query->execute([$idArticle]);

    $comments = $query->fetchAll();

    return $comments;
  }
}
