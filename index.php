<?php 

require "config/DataBase.php";

session_start();

//autoload
function chargerClasse($classe)
{
    $classe=str_replace('\\','/',$classe);      
    require "controllers/".$classe.'.php'; 
}

spl_autoload_register('chargerClasse'); //fin Autoload

$sliderController = new SliderController();
$productsController = new ProductsController();
$aboutController = new AboutController();
$adminController = new AdminController();
$userController = new UserController();

if (array_key_exists("action",$_GET))
{
    switch($_GET["action"])
    {
      case "products":
        if(array_key_exists('search',$_GET)) 
        {
          $productsController -> searchAjax($_GET['search']);
        } 
        else 
        {
          $productsController -> products();
        }
        break;
      case "productsSortByLowPrice":
        $productsController -> productsSortByLowPrice();
        break;
      case "productsSortByHighPrice":
        $productsController -> productsSortByHighPrice();
        break;
      case "detailsProduct":
        $productsController -> detailsProduct();
        break;
      case "about":
        $aboutController -> about();
        break;
      case "login":
        $adminController -> loginAdmin();
        $userController -> loginUser();
        break;
      case "deconnexion": 
        $adminController -> deconnexionAdmin();
        $userController -> deconnexionUser();
        break;
      case "create_account":
        $userController -> create_account();
        break;
    }
}
else 
{
    $sliderController -> listProduct();
    // $adminController -> create_admin()
    
}


