<?php

function get_system_config() { return array( 'environment' => 'development',
    //carabiner.php
    'carabiner' => array('base_uri' => $_SERVER['SERVER_NAME']),

    //config.php
    'config' => array('encryption_key' => 'FTPCLASS'),

    // database.php
    'database' => array (
        'hostname' => 'localhost',
        'username' => 'root',
        'password' => 'lionheart',
        'database' => 'prodserver_dataturs_frijan2920161',
    ),

    //Mysqli.php
    'quickbooks_mysqli' => array (
        'hostname' => 'localhost',
        'port' => '3306',
        'username' => 'root',
        'password' => 'lionheart'
    ),

    // ipnlistener.php
    'use_sandbox' => 'true',

    //paypal.php
    'sandbox' => 'FALSE',

    //customeraccountdataapi/config.php
    'customeraccountdataapi_config' => array('cert_path' => '/ssl/testapp1.crt',
    'private_key_path' => '/ssl/testapp1.key'),

    //IDS.php
    'URL_V3' => 'https://sandbox-quickbooks.api.intuit.com/v3'
);
}