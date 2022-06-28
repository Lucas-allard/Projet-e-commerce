<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class Action extends DataBase
{
  private $connexion;

  public function __construct()
  {
    $this->connexion = $this->getConnexion();
  }

  public function insertLike($idArticle)
  {
    $query = $this->connexion->prepare('
                                        INSERT INTO likes(
                                          id_article)
                                        VALUES(
                                          ?)
                                        ');
    $test = $query->execute([$idArticle]);

    return $test;
  }

  public function insertDislike($idArticle)
  {
    $query = $this->connexion->prepare('
                                        INSERT INTO dislikes(
                                          id_article)
                                        VALUES(
                                          ?)
                                        ');
    $test = $query->execute([$idArticle]);

    var_dump($test);

    return $test;
  }

  public function getLikes($idArticle)
  {
    $query = $this->connexion->prepare('
                                        SELECT 
                                          id_like
                                        FROM 
                                          likes
                                        WHERE 
                                          id_article = ?
                                        ');
    $query->execute([$idArticle]);

    $query->fetchAll();

    $likes = $query->rowCount();

    return $likes;
  }

  public function getDislikes($idArticle)
  {
    $query = $this->connexion->prepare('
                                        SELECT 
                                          id_dislike
                                        FROM 
                                          dislikes
                                        WHERE 
                                          id_article = ?
                                        ');
    $query->execute([$idArticle]);

    $query->fetchAll();

    $dislikes = $query->rowCount();

    return $dislikes;
  }
}
