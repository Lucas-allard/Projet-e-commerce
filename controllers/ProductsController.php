<?php

declare(strict_types=1);

namespace controllers;

use models\Products;
use controllers\SecurityController;

class ProductsController extends SecurityController
{
    private $products;

    public function __construct()
    {
        $this->products = new Products();
    }

    public function addProduct()
    {
        if ($this->isConnectAdmin()) {
            if (
                isset($_POST['product_name']) &&
                !empty($_POST['product_name']) &&
                isset($_POST['product_description']) &&
                !empty($_POST['product_description']) &&
                isset($_POST['product_alt']) &&
                !empty($_POST['product_alt']) &&
                isset($_POST['price']) &&
                !empty($_POST['price']) &&
                isset($_FILES['image_src']['name']) &&
                !empty($_FILES['image_src']['name']) &&
                isset($_POST['image_alt']) &&
                !empty($_POST['image_alt'])
            ) {
                $productName = $_POST['product_name'];
                $productName = htmlspecialchars($productName);
                $productDescription = $_POST['product_description'];
                $productDescription = htmlspecialchars($productDescription);
                $productAlt = $_POST['product_alt'];
                $productAlt = htmlspecialchars($productAlt);
                $price = $_POST['price'];
                $price = htmlspecialchars($price);
                $imageSrc = 'img/products/' . $_FILES['image_src']['name'];
                $imageSrc = htmlspecialchars($imageSrc);
                var_dump($imageSrc);
                $imageAlt = $_POST['image_alt'];
                $imageAlt = htmlspecialchars($imageAlt);

                $test = $this->products->insertProduct(
                    $productName,
                    $productDescription,
                    $productAlt,
                    $price,
                    $imageSrc,
                    $imageAlt
                );
                if ($test) {
                    $uploads_dir = 'views/img/products';
                    if (!empty($_FILES['image_src']['name'])) {
                        //si le nom de l'image n'est pas vide
                        $tmp_name = $_FILES['image_src']['tmp_name'];
                        $imageSrc = $_FILES['image_src']['name'];
                        move_uploaded_file($tmp_name, "$uploads_dir/$imageSrc");
                    }
                    // importer l'image dans le dossier
                    $message = ' insert OK ';
                    header(
                        'location:index.php?admin=login&add_product&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
        require 'views/admin/admin.phtml';
    }

    public function editProduct()
    {
        if ($this->isConnectAdmin()) {
            if (
                isset($_POST['product_name']) &&
                !empty($_POST['product_name']) &&
                isset($_POST['product_description']) &&
                !empty($_POST['product_description']) &&
                isset($_POST['product_alt']) &&
                !empty($_POST['product_alt']) &&
                isset($_POST['price']) &&
                !empty($_POST['price']) &&
                isset($_POST['image_alt']) &&
                !empty($_POST['image_alt'])
            ) {
                $productId = $_POST['id_product'];
                $productName = $_POST['product_name'];
                $productName = htmlspecialchars($productName);
                $productDescription = $_POST['product_description'];
                $productDescription = htmlspecialchars($productDescription);
                $productAlt = $_POST['product_alt'];
                $productAlt = htmlspecialchars($productAlt);
                $price = $_POST['price'];
                $price = htmlspecialchars($price);
                $imageAlt = $_POST['image_alt'];
                $imageAlt = htmlspecialchars($imageAlt);

                $imageSrc = 'img/products/' . $_POST['actual_image_src'];
                if (!empty($_FILES['image_src']['name'])) {
                    $uploads_dir = 'views/img/products';
                    unlink('views/' . $_POST['actual_image_src']);
                    $tmp_name = $_FILES['image_src']['tmp_name'];
                    $newImageSrc = $_FILES['image_src']['name'];
                    move_uploaded_file($tmp_name, "$uploads_dir/$newImageSrc");
                    $newImageSrc =
                        'img/products/' . $_FILES['image_src']['name'];
                } else {
                    $newImageSrc = $imageSrc;
                }

                $newImageSrc = htmlspecialchars($newImageSrc);

                $test = $this->products->updateProduct(
                    $productId,
                    $productName,
                    $productDescription,
                    $productAlt,
                    $price,
                    $newImageSrc,
                    $imageAlt
                );

                if ($test) {
                    $message = ' update OK ';
                    header(
                        'location:index.php?admin=login&edit_product&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
    }

    public function deleteProduct()
    {
        if ($this->isConnectAdmin()) {
            if (isset($_GET['id_product']) && !empty($_GET['id_product'])) {
                $id_product = $_GET['id_product'];
                $product = $this->products->getProductById($id_product);

                $test = $this->products->delProduct($id_product);

                if ($test) {
                    $image = 'views/' . $product['image_src'];
                    unlink($image);
                    $message = 'delete OK';
                    header(
                        'location:index.php?admin=login&delete_product&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
    }

    public function products(): void
    {
        $productsList = $this->products->getProducts();

        $template = 'products/products';

        require 'views/layout.phtml';
    }

    public function productsSortByHighPrice(): void
    {
        $productsList = $this->products->getProductsSortByHighPrice();

        $template = 'products/productsSortByHighPrice';

        require 'views/layout.phtml';
    }

    public function productsSortByLowPrice(): void
    {
        $productsList = $this->products->getProductsSortByLowPrice();

        $template = 'products/productsSortByLowPrice';

        require 'views/layout.phtml';
    }

    public function detailsProduct(): void
    {
        $productDetails = $this->products->getProductDetails();
        $deliveryDate = $this->products->getDeliveryDate();

        $template = 'products/detailsProduct';

        require 'views/layout.phtml';
    }

    public function searchAjax($search)
    {
        $searchResult = $this->products->searchProduct($search);

        echo json_encode($searchResult);
    }

    public function searchProduct()
    {
        if (array_key_exists('product', $_GET)) {
            $idProduct = $_GET['product'];
            $product = $this->products->getProductById($idProduct);
            echo json_encode($product);
        }
    }
}
