<?php 

declare(strict_types=1);

namespace models;

use config\DataBase;

class Slider extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  public function getDataSlider1(): ?array
  {
    $query = $this -> connexion -> prepare('
                                          SELECT
                                            products.`id_product`,
                                            `product_name`,
                                            `product_alt`,
                                            `price`,
                                            `image_alt`,
                                            `image_src`
                                          FROM
                                            products
                                          INNER JOIN images ON products.id_product = images.id_product
                                          WHERE
                                            image_src LIKE "%f%";
                                            ');
    $query -> execute();
    
    $sliderItems1 = $query -> fetchAll();

    return $sliderItems1;
  }

  public function getDataSlider2(): ?array
  {
    $query = $this -> connexion -> prepare('
                                          SELECT
                                            products.`id_product`,
                                            `product_name`,
                                            `product_alt`,
                                            `price`,
                                            `image_alt`,
                                            `image_src`
                                          FROM
                                            products
                                          INNER JOIN images ON products.id_product = images.id_product
                                          WHERE
                                            image_src LIKE "%n%";
                                            ');
    $query -> execute();
    
    $sliderItems2 = $query -> fetchAll();

    return $sliderItems2;
  }
}