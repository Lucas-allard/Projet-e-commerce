<?php
declare(strict_types=1);

class DataBase
{
    // attributs 
    private const SERVEUR = "localhost";
    private const USER = "root";
    private const MDP = "Aqwzsx123456!";
    private const BDD = "camiseta";
    private $connexion;
    
    //méthodes 
    public function getConnexion(): ?PDO
    {
        $this -> connexion = null;
        try
        {
            $this -> connexion = new PDO("mysql:host=".self::SERVEUR.";dbname=".self::BDD,self::USER,self::MDP);
            // gestion des accents 
            $this -> connexion -> exec("SET CHARACTER SET utf8");// -> appel une méthode d'une classe 
            
            // var_dump($connexion);
        }
        catch(Exception $message)
        {
            echo ' une erreur est parvenue au moment de la connexion BDD : '.$message->getMessage();
        }
        
        return $this -> connexion;
    }
}