<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class User extends DataBase
{
    private $connexion;
    
    public function __construct()
    {
        $this -> connexion = $this -> getConnexion();
    }
    
    public function addUser(string $username,string $lastname,string $name,string $phone,string $email,string $address,string $zipCode,string $city,string $birth,string $password): bool
    {
        $query = $this -> connexion -> prepare('
                                                INSERT INTO `users`(
                                                    username,
                                                    `lastname`,
                                                    `name`,
                                                    `phone`,
                                                    `email`,
                                                    `address`,
                                                    `zip_code`,
                                                    `city`,
                                                    `birth`,
                                                    `password`
                                                )
                                                VALUES(
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?,
                                                    ?
                                                    )    
                                                ');
        $result = $query -> execute([$username,$lastname,$name,$phone,$email,$address,$zipCode,$city,$birth,$password]);
        return $result;
    }
    
    public function getUserByMail(string $email)
    {
        $query = $this -> connexion -> prepare('
                                                SELECT
                                                    `email`,                                                   
                                                FROM
                                                    `users`
                                                WHERE
                                                    email = ?
                                                ');
        $query -> execute([$email]);
        $result = $query -> fetch();
        return $result;
    }
    
    public function getUserByUsername(string $username)
    {
        $query = $this -> connexion -> prepare('
                                                SELECT
                                                    `id_user`,
                                                    `lastname`,
                                                    `name`,
                                                    username,
                                                    `phone`,
                                                    `email`,
                                                    `address`,
                                                    `zip_code`,
                                                    `city`,
                                                    `birth`,
                                                    `password`
                                                FROM
                                                    `users`
                                                WHERE
                                                    username = ?
                                                ');
        $query -> execute([$username]);
        $result = $query -> fetch();
        return $result;
    }
}