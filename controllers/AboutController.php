<?php 

declare(strict_types=1);

require 'models/About.php';

class AboutController 
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