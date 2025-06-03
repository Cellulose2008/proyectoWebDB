const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db')
const path = require ('path');
const app = express();
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static('public'));
app.post('/login', (req, res) => {
	const { usuario, contrasena, accion } = req.body;

	if (!usuario || !contrasena) {
		return res.send('Completa todos los campos');
	}

	if (accion === 'login') {
		const sql = 'SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?';
		db.query(sql, [usuario, contrasena], (err, resultados) => {
			if (err) throw err;

			if (resultados.length > 0) {
				res.send('Inicio de sesión exitoso');
			} else {
				res.send('Usuario o contraseña incorrectos');
			}
		});
	} else if (accion === 'registro') {
		// Verifica si ya existe el usuario
		const checkSql = 'SELECT * FROM usuarios WHERE usuario = ?';
		db.query(checkSql, [usuario], (err, resultados) => {
			if (err) throw err;

			if (resultados.length > 0) {
				res.send('Nombre de usuario ya registrado');
			} else {
				const insertSql = 'INSERT INTO usuarios (usuario, contrasena) VALUES (?, ?)';
				db.query(insertSql, [usuario, contrasena], (err, resultado) => {
					if (err) throw err;
					res.send('Registro exitoso');
				});
			}
		});
	} else {
		res.send('Acción invalida');
	}
});

app.listen(3000,()=>{
	console.log('Servidor corriendo en http://localhost:3000');
});