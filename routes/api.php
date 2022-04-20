<?php

$path = str_replace("/", "", str_replace("api", "", $_SERVER['REQUEST_URI']));
$path = explode("?", $path)[0];
switch ($path) {
    case "date":
        echo (new ListingController())->dates();
        break;
    case "employee":
        echo (new ListingController())->employees();
        break;
    case "detail":
        echo (new ListingController())->detail();
        break;
    default:
        echo (new ListingController())->dates();
}
