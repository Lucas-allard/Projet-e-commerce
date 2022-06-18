<?php 

session_start();

use config\DataBase;
use controllers\SliderController;
use controllers\UserController;
use controllers\AdminController;
use controllers\ProductsController;
use controllers\AboutController;
use controllers\CartController;

function chargerClasse($classe)
{
    $classe=str_replace('\\','/',$classe);      
    require $classe.'.php'; 
}

spl_autoload_register('chargerClasse'); //fin Autoload

$sliderController = new SliderController();
$productsController = new ProductsController();
$aboutController = new AboutController();
$adminController = new AdminController();
$userController = new UserController();
$cartController = new CartController();

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
      $userController -> loginUser();
      break;
    case "deconnexion": 
      $adminController -> deconnexionAdmin();
      $userController -> deconnexionUser();
      break;
    case "create_account":
      $userController -> create_account();
      break;
    case "add_cart": 
      if (array_key_exists("id_product", $_GET))
      {
        $cartController -> addCart($_GET['id_product']);
      }
      break;
    case "remove_cart": 
      if (array_key_exists("id_product", $_GET))
      {
        $cartController -> removeCart($_GET['id_product']);
        
      }
      break;
    case "del_cart": 
      if (array_key_exists("id_product", $_GET))
      {
        $cartController -> deleteCart($_GET['id_product']);
      }
      break;
    case "get_cart": 
      if (array_key_exists("id_user", $_GET))
      {
        $cartController -> getCart($_GET['id_user']);
        
      }
      break;
    
  }
}
elseif (array_key_exists("admin",$_GET))
{
  switch($_GET["admin"])
  {
    case "login":
      $adminController -> loginAdmin();
      break;
  }
}
else 
{
    $sliderController -> listProduct();    
}


