<?php

declare(strict_types=1);

require "models/Slider.php";

class SliderController
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