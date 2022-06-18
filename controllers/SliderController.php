<?php

declare(strict_types=1);


namespace controllers;

use models\Slider;
use controllers\SecurityController;

class SliderController extends SecurityController
{
    private $slider;

    public function __construct()
    {
        $this -> slider = new Slider();
    }

    public function listProduct():void
    {
        // appel au model 
        $sliderItems1 = $this -> slider -> getDataSlider1();
        $sliderItems2 = $this -> slider -> getDataSlider2();
        // passer par le template pour afficher 
        $template ="home";
        require "views/layout.phtml";
    }
}