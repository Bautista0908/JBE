document.addEventListener("DOMContentLoaded", () => { form = document.getElementById("form_login");

form.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = {
    email: form.email.value.trim(),
    password: form.password.value
    };

    try {
    const response = await fetch("api/api_aspirantes.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    });

      const result = await response.json(); // parse directamente

    if (result.success) {
        alert("✅ Bienvenido " + result.nombre);
        window.location.href = "index.html"; // página de inicio
    } else {
        alert("❌ " + (result.error || "Credenciales incorrectas"));
    }

    } catch (error) {
    alert("⚠️ Error de conexión con el servidor.");
    console.error("Error:", error);
    }
});
});
