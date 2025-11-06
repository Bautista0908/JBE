<?php
header('Content-Type: application/json; charset=utf-8');
error_reporting(E_ALL);
ini_set('display_errors', 1);

$host = 'localhost';
$dbname = 'jbe';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $input = json_decode(file_get_contents("php://input"), true);
    $email = trim($input['email'] ?? '');
    $password = $input['password'] ?? '';

    if (!$email || !$password) {
        echo json_encode(['error' => 'Faltan datos']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT Nombre, Contraseña FROM empresa WHERE Email = ?");
    $stmt->execute([$email]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$usuario) {
        echo json_encode(['error' => 'Correo no registrado']);
        exit;
    }

    // if (!password_verify($password, $usuario['Contraseña'])) {
        if ($password != $usuario['Contraseña']) {
        echo json_encode(['error' => 'Contraseña incorrecta']);
        exit;
    }

    echo json_encode([
        'success' => true,
        'nombre' => $usuario['Nombre'],
        'message' => 'Inicio de sesión exitoso'
    ]);

} catch (PDOException $e) {
    echo json_encode(['error' => 'Error de base de datos: ' . $e->getMessage()]);
}
?>