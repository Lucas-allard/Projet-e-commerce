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

if (array_key_exists("action",$_GET))
{
    switch($_GET["action"])
    {
      case "products":
        $productsController -> products();
        break;
      case "detailsProduct":
        $productsController -> detailsProduct();
        break;
      case "about":
        $aboutController -> about();
        break;        
    }
}
else 
{
    $sliderController -> listProduct();
}


