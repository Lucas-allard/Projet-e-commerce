<?php 

declare(strict_types=1);

class About extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  
}