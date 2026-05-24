<?php
use App\Core\Route;

return [
    Route::get('|^$|', 'Main', 'home'),

    Route::get('|^product/all$|', 'Product', 'getAll'),
    Route::get('|^product/category/([0-9]+)$|', 'Product', 'getByCategory'),
    Route::get('|^product/statistics$|', 'Product', 'getStatistics'),

    Route::get('|^order/all$|', 'Order', 'getAll'),
    Route::get('|^order/statistics$|', 'Order', 'getStatistics'),

    Route::get('|^admin/login$|', 'Admin', 'getLogin'),
    Route::post('|^admin/login$|', 'Admin', 'postLogin'),
    Route::get('|^admin/dashboard$|', 'Admin', 'dashboard'),
    Route::get('|^admin/product/add$|', 'Admin', 'getAddProduct'),
    Route::post('|^admin/product/add$|', 'Admin', 'postAddProduct'),
    Route::get('|^admin/product/delete/([0-9]+)$|', 'Admin', 'deleteProduct'),
    Route::get('|^admin/logout$|', 'Admin', 'logout'),

    Route::post('|^cart/add/([0-9]+)$|', 'Cart', 'add'),
    Route::get('|^cart/view$|', 'Cart', 'view'),
    Route::get('|^cart/remove/([0-9]+)$|', 'Cart', 'remove'),
    Route::get('|^cart/clear$|', 'Cart', 'clear'),
    Route::get('|^customer/register$|', 'Customer', 'getRegister'),
    Route::post('|^customer/register$|', 'Customer', 'postRegister'),
    Route::get('|^customer/login$|', 'Customer', 'getLogin'),
    Route::post('|^customer/login$|', 'Customer', 'postLogin'),
    Route::get('|^customer/logout$|', 'Customer', 'logout'),
    Route::post('|^cart/checkout$|', 'Cart', 'checkout'),
];