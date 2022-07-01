<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class Contact extends DataBase
{
  private $connexion;

  public function __construct()
  {
    $this->connexion = $this->getConnexion();
  }
}
