<?php 

declare(strict_types=1);

namespace controllers;

use models\About;
use controllers\SecurityController;

class AboutController extends SecurityController
{
  private $about;

  public function __construct()
  {
    $this -> about = new About();
  }

  public function about():void
  {
    $template = 'about/about';

    require 'views/layout.phtml';
  }
}