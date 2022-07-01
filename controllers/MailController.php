<?php

namespace controllers;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;
use controllers\SecurityController;

require_once('./includes/phpmailer/Exception.php');
require_once('./includes/phpmailer/PHPMailer.php');
require_once('./includes/phpmailer/SMTP.php');


class MailController extends SecurityController
{

  private $mail;

  public function __construct()
  {
    $this->mail = new PHPMailer(true);
  }

  public function sendMail()
  {
    if (
      isset($_POST['subject']) &&
      !empty($_POST['subject']) &&
      isset($_POST['mail']) &&
      !empty($_POST['mail']) &&
      isset($_POST['content']) &&
      !empty($_POST['content'])
    ) {

      $mail = $_POST['mail'];
      $subject = $_POST['subject'];
      $content = $_POST['content'];

      try {
        $this->mail->SMTPDebug = SMTP::DEBUG_SERVER;

        $this->mail->isSMTP();
        $this->mail->Host = 'localhost';
        $this->mail->Port = 1025;

        $this->mail->CharSet = "utf-8";

        $this->mail->addAddress("no-reply@camiseta.fr");

        $this->mail->setFrom($mail);

        $this->mail->Subject = $subject;

        $this->mail->Body = $content;

        $test = $this->mail->send();

        if ($test) {
          $message = "Demande envoyé";

          header('location:index.php?action=contact&message=' . $message);
        }
      } catch (Exception $message) {
        $message = "Message non envoyé. Erreur : {$this->mail->ErrorInfo}";
      }
    }
  }
}
