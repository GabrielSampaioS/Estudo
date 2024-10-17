const mysql = require('mysql2');

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', 
    database: 'nodemysql'
});

conn.connect((err) => {
    if (err) {
        console.log('Erro ao conectar ao MySQL: ', err);
        process.exit(1);
    }
    console.log('Conectado ao MySQL');
});

module.exports = conn;  
