<?php 

declare(strict_types=1);

require 'models/Admin.php';

class AdminController
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
                   header("location:index.php?action=admin");
               } 
               else 
               {
                $message = "Votre mot de passe est incorrect";    
               }
            }
            else {
                $message = "Votre nom d'utilisateur est incorrect";
            }
        }
    }
    
    public function deconnexionAdmin()
    {
        unset($_SESSION["admin"]);
        session_destroy();
        
        header("location:index.php");
    }
}