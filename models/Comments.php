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

  public function updateComment($lastName, $name, $content, $idComment)
  {
    $query = $this->connexion->prepare('
                                        UPDATE 
                                            comments
                                        SET
                                        `last_name` = ?,
                                        `name` = ?,
                                        `content` = ?
                                        WHERE
                                            id_comment = ?
                                        ');

    $test = $query->execute([
      $lastName,
      $name,
      $content,
      $idComment
    ]);

    return $test;
  }

  public function delComment($idComment)
  {
    $query = $this->connexion->prepare('
                                            DELETE FROM 
                                              comments
                                            WHERE 
                                              id_comment = ?
                                            ');
    $test = $query->execute([$idComment]);

    var_dump($test);
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

  public function getCommentById($idComment)
  {
    $query = $this->connexion->prepare('
                                        SELECT
                                          id_comment,
                                          `last_name`,
                                          `name`,
                                          `date_create`,
                                          `content`
                                        FROM
                                          comments
                                        WHERE
                                          id_comment = ?
                                        ORDER BY 
                                          date_create DESC
                                      ');

    $query->execute([$idComment]);

    $comment = $query->fetch();

    return $comment;
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

  public function getCommentsForAdmin()
  {
    $query = $this->connexion->prepare('
                                        SELECT
                                          id_comment,
                                          `last_name`,
                                          `name`,
                                          comments.`date_create`,
                                          comments.`content`,
                                          title
                                        FROM
                                            comments
                                        INNER JOIN articles ON comments.id_article = articles.id_article
                                        ORDER BY
                                            comments.date_create
                                        DESC
                                      ');

    $query->execute();

    $comments = $query->fetchAll();

    return $comments;
  }
}
