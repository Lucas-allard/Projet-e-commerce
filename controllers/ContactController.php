<?php

declare(strict_types=1);

namespace controllers;

use models\Contact;
use controllers\SecurityController;

class ContactController extends SecurityController
{
  private $contact;

  public function __construct()
  {
    $this->contact = new Contact();
  }

  public function contact(): void
  {
    $template = 'contact/contact';

    require 'views/layout.phtml';
  }
}
