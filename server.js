const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db')
const path = require ('path');
const app = express();
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static('public'));

// Redirigir al login al entrar al localhost
app.get('/', (req, res) => {
    res.redirect('/login.html');
});

app.post('/login', (req, res) => {
	const { usuario, contrasena, accion } = req.body;

	if (!usuario || !contrasena) {
		return res.send('Completa todos los campos');
	}

	if (accion === 'login') {
		const sql = 'SELECT * FROM usuario WHERE Nombre = ? AND Contrasena = ?';
		db.query(sql, [usuario, contrasena], (err, resultados) => {
			if (err) throw err;

			if (resultados.length > 0) {
				res.redirect('/proyectoWeb.html'); // Redirige al dashboard
			} else {
				res.send('Usuario o contraseña incorrectos');
			}
		});
	} else if (accion === 'registro') {
		// Verifica si ya existe el usuario
		const checkSql = 'SELECT * FROM usuario WHERE Nombre = ?';
		db.query(checkSql, [usuario], (err, resultados) => {
			if (err) throw err;

			if (resultados.length > 0) {
				res.send('Nombre de usuario ya registrado');
			} else {
				const insertSql = 'INSERT INTO usuario (Nombre, Contrasena) VALUES (?, ?)';
				db.query(insertSql, [usuario, contrasena], (err, resultado) => {
					if (err) throw err;
					res.redirect('/proyectoWeb.html'); // Redirige después de registrar
				});
			}
		});
	} else {
		res.send('Acción invalida');
	}
});

app.get('/perfil', (req, res) => {
    // Supón que el usuario está en req.query.usuario (ejemplo: /perfil?usuario=Juan)
    const usuario = req.query.usuario;
    if (!usuario) return res.send('Usuario no especificado');

    const sql = 'SELECT Nombre FROM usuario WHERE Nombre = ?';
    db.query(sql, [usuario], (err, resultados) => {
        if (err) throw err;
        if (resultados.length === 0) return res.send('Usuario no encontrado');

        // Renderiza el HTML con el nombre (puedes usar una plantilla o reemplazo simple)
        const fs = require('fs');
        fs.readFile(path.join(__dirname, 'public', 'perfil.html'), 'utf8', (err, data) => {
            if (err) throw err;
            // Reemplaza un marcador en el HTML por el nombre real
            const html = data.replace('Nombre Usuario', resultados[0].Nombre);
            res.send(html);
        });
    });
});

app.listen(3000,()=>{
	console.log('Servidor corriendo en http://localhost:3000');
});