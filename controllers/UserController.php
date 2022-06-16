<?php 

declare(strict_types=1);

require "models/User.php";


class UserController 
{
    private $user;
    
    public function __construct()
    {
        $this -> user = new User();
    }
    
    public function create_account()
    {
        $template = "user/create_account";
        
        if (isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["lastname"]) && !empty($_POST["lastname"]) && isset($_POST["name"]) && !empty($_POST["name"]) && isset($_POST["phone"]) && !empty($_POST["phone"]) && isset($_POST["email"]) && !empty($_POST["email"]) && isset($_POST["address"]) && !empty($_POST["address"]) && isset($_POST["zip-code"]) && !empty($_POST["zip-code"]) && isset($_POST["city"]) && !empty($_POST["city"]) && isset($_POST["birth"]) && !empty($_POST["birth"]) && isset($_POST["password"]) && !empty($_POST["password"])) 
        {
            $emailAlreadyExist = $this -> user -> getUserByMail($_POST["email"]);
            $usernameAlreadyExist = $this -> user -> getUserByUsername($_POST["username"]);

            if (!$emailAlreadyExist && !$usernameAlreadyExist)
            {
                $username = $_POST["username"];
                $username = htmlspecialchars($username);
                $lastname = $_POST["lastname"];
                $lastname = htmlspecialchars($lastname);
                $name = $_POST["name"];
                $name = htmlspecialchars($name);
                $phone = $_POST["phone"];
                $phone = htmlspecialchars($phone);
                $email = $_POST["email"];
                $email = htmlspecialchars($email);
                $address = $_POST["address"];
                $address = htmlspecialchars($address);
                $zipCode = $_POST["zip-code"];
                $zipCode = htmlspecialchars($zipCode);
                $city = $_POST["city"];
                $city = htmlspecialchars($city);
                $birth = $_POST["birth"];
                $birth = htmlspecialchars($birth);
                $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
                $password = htmlspecialchars($password);
                
                $test = $this -> user -> addUser($username,$lastname,$name,$phone,$email,$address,$zipCode,$city,$birth,$password);
                
                if ($test) 
                {
                    $message = "Votre compte a été crée";
                    header("location:index.php?message=".$message);
                }
            }
            else 
            {
                $message = "Un compte à déja été créer avec ce nom d'utilisateur ou cet adresse mail";
            }
        }
        require "views/layout.phtml";
    }
    
    public function loginUser()
    {
        if (isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["password"]))
        {
            $username = $_POST["username"];
            $username = htmlspecialchars($username);
            $password = $_POST["password"];
            $password = htmlspecialchars($password);
            
            $result = $this -> user -> getUserByUsername($username);
            
            if ($result) 
            {
               if (password_verify($password, $result["password"])) 
               {
                   $_SESSION["user"] = $username;
                   header("location:index.php");
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
    }
    
    public function deconnexionUser()
    {
        unset($_SESSION["user"]);
        session_destroy();
        
        header("location:index.php");
    }
}