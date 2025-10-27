<?php
header('Content-Type: application/json; charset=utf-8');

// Configuración DB
$host = 'localhost';
$dbname = 'jbe';
$user = 'root';
$pass = '';

try {
    // Conexión PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Obtener datos POST y sanitizar un poco
    $nombre = trim($_POST['nombre'] ?? '');
    $apellido = trim($_POST['apellido'] ?? '');
    $contraseña = $_POST['password'] ?? '';
    $email = $_POST['email'] ?? '';
    $telefono = trim($_POST['telefono'] ?? '');

    // Validaciones básicas
    if (!$nombre || !$apellido || !$contraseña || !$email || !$telefono) {
        http_response_code(400);
        echo json_encode(['error' => 'Faltan datos obligatorios o email inválido']);
        exit;
    }

    // Hashear contraseña con PASSWORD_DEFAULT (bcrypt)
    $passHash = password_hash($contraseña, PASSWORD_DEFAULT);

    // Verificar si el email ya existe
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM aspirante WHERE Gmail = ?");
    $stmt->execute([$email]);
    if ($stmt->fetchColumn() > 0) {
        http_response_code(409);
        echo json_encode(['error' => 'El correo electrónico ya está registrado']);
        exit;
    }

    // Insertar en DB
    $stmt = $pdo->prepare("INSERT INTO aspirante (Nombre, apellido, Contraseña, Gmail, Telefono) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$nombre, $apellido, $passHash, $email, $telefono]);

    echo json_encode(['success' => true, 'message' => 'Registro exitoso']);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Error de base de datos: ' . $e->getMessage()]);
}
