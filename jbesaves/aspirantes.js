document.getElementById('form_registro').addEventListener('submit', async (e) => {
  e.preventDefault();

  const form = e.target;

  // Creamos el objeto JSON que enviará JS
  const data = {
    nombre: form.Nombre.value.trim(),
    apellido: form.Apellido.value.trim(),
    telefono: form.Telefono.value.trim(),
    email: form.Email.value.trim(),
    password: form.Contraseña.value // debe coincidir con el PHP
  };

  // Validación rápida antes de enviar
  if (!data.nombre || !data.apellido || !data.telefono || !data.email || !data.password) {
    alert('❌ Todos los campos son obligatorios');
    return;
  }

  try {
    const res = await fetch('api/api_registrar_aspirante.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });

    // Verificamos que la respuesta sea JSON
    if (!res.ok) {
      const text = await res.text();
      console.error('Error HTTP:', text);
      alert('⚠️ Error en la solicitud al servidor');
      return;
    }

    const result = await res.json();

    if (result.success) {
      alert('✅ Registro exitoso');
      window.location.href = 'inicio_sesionAspirante.html';
    } else {
      alert('❌ Error al registrar: ' + (result.error || 'Desconocido'));
    }
  } catch (err) {
    alert('⚠️ Error de conexión');
    console.error('Error de fetch:', err);
  }
});
