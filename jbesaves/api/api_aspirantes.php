<?php
// Configuración de la conexión
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "jbe";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Revisar la acción que se pide
$accion = $_REQUEST['accion'] ?? '';

if ($accion === "insertar") {
    // INSERTAR USUARIO
    $nombre = $_POST['nombre'];
    $pass = $_POST['password'];
    $apellido = $_POST['apellido'];
    $Correoelectronico = $_POST['CorreoElectrónico'];
    $Numerodetelefono = $_POST['NúmeroDeTeléfono'];
    $sql = "INSERT INTO aspirante (Nombre, apellido, Contraseña, Gmail, Telefono) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $nombre, $apellido, $pass, $Correoelectronico, $Numerodetelefono );

    if ($stmt->execute()) {
        // Redirigir a index.html (se usará fetch para cargar los datos)
        //header("Location: index.html");
        echo json_encode(['success' => true, 'message' => 'Usuario registrado']);
        exit();
    } else {
        echo json_encode(['success' => false, 'error' => $stmt->error]);
        exit();
    }
}
elseif ($accion === "listar") {
    // LISTAR USUARIOS
    $sql = "SELECT id, nombre FROM usuarios";
    $resultado = $conn->query($sql);

    $usuarios = [];
    while ($fila = $resultado->fetch_assoc()) {
        $usuarios[] = $fila;
    }

    // Devolver como JSON
    header('Content-Type: application/json');
    echo json_encode($usuarios);
    exit();
}
elseif ($accion === "login") {
    $nombre = $_POST['nombre'];
    $pass = $_POST['password'];

    $sql = "SELECT * FROM usuarios WHERE nombre = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $nombre);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if($fila = $resultado->fetch_assoc()) {
        // Validar contraseña
        if($fila['password'] === $pass) { // si se usa password_hash, cambiar a password_verify
            echo json_encode(['success' => true, 'nombre' => $fila['nombre']]);
        } else {
            echo json_encode(['success' => false]);
        }
    } else {
        echo json_encode(['success' => false]);
    }
    exit();
}

$conn->close();
?>