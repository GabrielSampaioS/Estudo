// Configurando Server

const express = require('express')
const exphbs = require('express-handlebars')
const path = require('path')
const mysql = require('mysql')

const app = express()

// Definir partials
const hbs = exphbs.create({
    partialsDir: ['views/partials'],
})

app.engine('handlebars', hbs.engine)
app.set('view engine', 'handlebars')

// Conseguir visualizar a pasta public
app.use(express.static(path.join(__dirname, 'public')))

// Configurando Server -- FIM

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'NodeMySQL'
})

// Conectar ao banco de dados
conn.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', err)
        return
    }
    console.log('Conectado ao banco de dados MySQL')
})

// Rota principal
app.get('/', (req, res) => {
    res.render('home')
    console.log('Teste')
})

// Inicializando o servidor
app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000')
})
