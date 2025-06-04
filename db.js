const mysql = require('mysql');
const db = mysql.createConnection({
	host:'localhost',
	user:'root',
	password:'',
	database:'bd_proyecto_web'
});

db.connect((err)=>{
	if(err) throw err;
	console.log('Conectado a Mysql');
});
module.exports=db;
