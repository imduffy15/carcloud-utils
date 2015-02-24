<?php

header('Content-type: text/plain');

if (!function_exists('getallheaders')) 
{ 
    function getallheaders() 
    { 
           $headers = ''; 
       foreach ($_SERVER as $name => $value) 
       { 
           if (substr($name, 0, 5) == 'HTTP_') 
           { 
               $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value; 
           } 
       } 
       return $headers; 
    } 
} 


file_put_contents("./data/" . time() . ".txt", print_r(getallheaders(), true) . "\n\n\n\n" . file_get_contents("php://input"));

?>
