<?php
use App\Core\Router;
require_once 'vendor/autoload.php';
require_once 'Configuration.php';
session_start();

$config = new App\Core\DatabaseConfiguration(
    Configuration::DATABASE_HOST,
    Configuration::DATABASE_NAME,
    Configuration::DATABASE_USER,
    Configuration::DATABASE_PASS
);

define('BASE', Configuration::BASE);

$router = new Router();
foreach (require_once 'Routes.php' as $route) {
    $router->add($route);
}

$url = trim(strval(filter_input(INPUT_GET, 'URL') ?? ''), '/');
$httpMethod = filter_input(INPUT_SERVER, 'REQUEST_METHOD') ?? 'GET';
$foundRoute = $router->find($httpMethod, $url);

if (!$foundRoute) {
    http_response_code(404);
    echo 'Ruta nije pronadjena.';
    exit;
}

$dbCon = new App\Core\DatabaseConnection($config);
$fullControllerName = 'App\\Controllers\\' . $foundRoute->getControllerName() . 'Controller';
$method = $foundRoute->getMethodName();
$parameters = $foundRoute->extractArguments($url);
$controllerInstance = new $fullControllerName($dbCon);
call_user_func_array([$controllerInstance, $method], $parameters);

$data = $controllerInstance->getData();
$data['BASE'] = BASE;
$data['isLoggedIn'] = !empty($_SESSION['admin_id']);
$data['adminUsername'] = $_SESSION['admin_username'] ?? null;

$loader = new Twig_Loader_Filesystem('./Views');
$twig = new Twig_Environment($loader, ['cache' => false, 'auto_reload' => true]);

echo $twig->render(
    $foundRoute->getControllerName() . '/' . $foundRoute->getMethodName() . '.html',
    $data
);
