<?php
header('Content-Type: application/json; charset=utf-8');

// Configuración DB
$host = 'localhost';
$dbname = 'jbe';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Leer JSON
    $input = json_decode(file_get_contents("php://input"), true);

$Nombre = trim($input['nombre'] ?? '');
    $Apellido = trim($input['apellido'] ?? '');
    $Telefono = trim($input['telefono'] ?? '');
    $Email = trim($input['email'] ?? '');
    $Contraseña = $input['password'] ?? '';


    if (!$Nombre || !$Apellido || !$Telefono || !$Email || !$Contraseña) {
        http_response_code(400);
        echo json_encode(['error' => 'Faltan datos obligatorios']);
        exit;
    }

    // Hashear contraseña
    $passHash = password_hash($Contraseña, PASSWORD_DEFAULT);

    // Verificar si el email ya existe
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM aspirante WHERE Email = ?");
    $stmt->execute([$Email]);
    if ($stmt->fetchColumn() > 0) {
        http_response_code(409);
        echo json_encode(['error' => 'El correo electrónico ya está registrado']);
        exit;
    }

    // Insertar aspirante
    $stmt = $pdo->prepare("INSERT INTO aspirante (Nombre, Apellido, Telefono, Email, Contraseña) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$Nombre, $Apellido, $Telefono, $Email, $Contraseña]);

    echo json_encode(['success' => true, 'message' => 'Aspirante registrado exitosamente']);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Error de base de datos: ' . $e->getMessage()]);
}
