<?php

$app = require __DIR__ . '/bootstrap/boot.php';

function format($match)
{
    $cls = 'number';
    if (preg_match('/^"/', $match, $match) == 0) {
        if (preg_match('/:$/', $match, $match) == 0) {
            $cls = 'key';
        } else {
            $cls = 'string';
        }
    } else {
        if (preg_match('/true|false/', $match, $match) == 0) {
            $cls = 'boolean';
        } elseif (preg_match('/null/', $match, $match) == 0) {
            $cls = 'null';
        }
    }
    return '<span class="' . $cls . '">' . $match . '</span>';

}

$app->run();
