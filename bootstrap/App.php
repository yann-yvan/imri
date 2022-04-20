<?php


class App
{
    public function run()
    {
        require __DIR__."/../Controllers/ListingController.php";
        require __DIR__."./../routes/api.php";
    }
}
