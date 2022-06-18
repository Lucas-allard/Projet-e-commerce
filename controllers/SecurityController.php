<?php 

declare(strict_types=1);

namespace controllers;

class SecurityController
{
  public function isConnectAdmin(): bool
  {
    if (isset($_SESSION['admin'])) 
    {
      return true;
    }
    else 
    {
      return false;
    }
  }

  public function isConnectUser(): bool
  {
    if (isset($_SESSION['user'])) 
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
}