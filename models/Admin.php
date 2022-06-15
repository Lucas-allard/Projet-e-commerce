<?php 

declare(strict_types=1);

class Admin extends DataBase 
{
    private $connexion;
    
    public function __construct()
    {
        $this -> connexion = $this -> getConnexion();
    }
    
    public function addAdmin($username,$password)
    {
        $query = $this -> connexion -> prepare('
                                                INSERT INTO `admin`(`username`, `password`)
                                                VALUES(?, ?)
                                                ');
        
        $query -> execute([$username,$password]);
    }
    
    public function getAdminByUsername(string $username): bool|array
    {
        $query = $this -> connexion -> prepare('
                                            SELECT
                                                `username`,
                                                `password`,
                                                `ID_admin`
                                            FROM
                                                admin
                                            WHERE username = ?
                                            ');
        $query -> execute([$username]);
        $result = $query -> fetch();
        return $result;
    }
}