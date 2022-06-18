<?php 

declare(strict_types=1);

namespace controllers;

use models\Admin;
use controllers\SecurityController;

class AdminController extends SecurityController
{
    private $admin;
    
    public function __construct()
    {
        $this -> admin = new Admin();
    }
    
    public function create_admin(){
        $username = "admin";
        $password = password_hash("admin", PASSWORD_DEFAULT);
        
        $this -> admin -> addAdmin($username,$password);
    }
    
    public function loginAdmin()
    {
        $template = 'admin/login';

        if (isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["password"]))
        {
            $username = $_POST["username"];
            $username = htmlspecialchars($username);
            $password = $_POST["password"];
            $password = htmlspecialchars($password);
            
            $result = $this -> admin -> getAdminByUsername($username);
            
            if ($result) 
            {
               if (password_verify($password, $result["password"])) 
               {
                   $_SESSION["admin"] = $username;
                   $message = "Connexion validé";
                   header("location:index.php?message=".$message);
               } 
               else 
               {
                $message = "Votre mot de passe est incorrect";
                header("location:index.php?message=".$message);    
               }
            }
            else {
                $message = "Votre nom d'utilisateur est incorrect";
                header("location:index.php?message=".$message);        
            }
        }
        require "views/layout.phtml";
    }
    
    public function deconnexionAdmin()
    {
        unset($_SESSION["admin"]);
        session_destroy();
        $message = "Vous avez été déconnecté";
        header("location:index.php?message=" .$message);
    }
}