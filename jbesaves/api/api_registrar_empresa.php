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

    // Leer el cuerpo JSON
    $input = json_decode(file_get_contents("php://input"), true);

    // Obtener y limpiar datos
    $Nombre = trim($input['nombre'] ?? '');
    $Telefono = trim($input['telefono'] ?? '');
    $Email = trim($input['email'] ?? '');
    $Contraseña = $input['password'] ?? '';

    // Validaciones básicas
    if (!$Nombre || !$Telefono || !$Email || !$Contraseña) {
        http_response_code(400);
        echo json_encode(['error' => 'Faltan datos obligatorios o email inválido']);
        exit;
    }

    // Hashear la contraseña
    $passHash = password_hash($Contraseña, PASSWORD_DEFAULT);

    // Verificar si el email ya está registrado
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM empresa WHERE Email = ?");
    $stmt->execute([$Email]);
    if ($stmt->fetchColumn() > 0) {
        http_response_code(409);
        echo json_encode(['error' => 'El correo electrónico ya está registrado']);
        exit;
    }

    // Insertar nueva empresa
    $stmt = $pdo->prepare("INSERT INTO empresa (Nombre, Telefono, Email, Contraseña) VALUES (?, ?, ?, ?)");
    $stmt->execute([$Nombre, $Telefono, $Email, $passHash]);

    echo json_encode(['success' => true, 'message' => 'Empresa registrada exitosamente']);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Error de base de datos: ' . $e->getMessage()]);
}
?>
