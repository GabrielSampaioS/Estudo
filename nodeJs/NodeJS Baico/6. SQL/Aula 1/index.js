/*
Sugestão  para melhoria
1. Separar as Rotas em Módulos:
2. Criar um Arquivo de Conexão com o Banco de Dados:
3. Utilizar dotenv para Configurações Sensíveis:
4. Melhorar a Segurança (SQL Injection):
*/


// Configurando Server

const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path');
const mysql = require('mysql');

const app = express();

app.use(
    express.urlencoded({
        extended: true //Conseguir pegar o body
    })
)

app.use(express.json())

// Definir partials
const hbs = exphbs.create({
    partialsDir: ['views/partials'],
});

app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

// Conseguir visualizar a pasta public
app.use(express.static(path.join(__dirname, 'public')));

// Configurando Server -- FIM

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'test'
});

// Conectar ao banco de dados
conn.connect(function (erro) { // Certifique-se de usar 'erro' aqui
    if (erro) {
        console.log(erro);
        return; // Para evitar continuar caso haja erro
    }

    console.log('Conectado ao SQL');

    app.listen(3000, () => {
        console.log('Servidor rodando na porta 3000');
    });
});

// ROTAS

app.get('/books', (req, res) => {
    const query = "SELECT * FROM BOOKS"

    conn.query(query, function (err, data) {
        if (err) {
            console.log(err);
            return res.status(500).send('Erro ao visualizar os livros.');
        }

        const books = data

        res.render('books', { books })

    })


})

app.get('/book/edit/:id', (req, res) => {

    const id = req.params.id
    const query = `SELECT * FROM BOOKS WHERE ID = ${id}`


    conn.query(query, function (err, data) {
        if (err) {
            console.log(err)
            return res.status(500).send('Erro ao editar o livro.');
        }
        const book = data[0]
        console.log[book]
        res.render('bookEdit', { book })
    })

})

app.post('/book/updatebook', (req, res) => {
    const id = req.body.id
    const title = req.body.title
    const pageqty = req.body.pagesqty


    const query = `UPDATE books SET nome = '${title}', qtdPaginas = '${pageqty}' WHERE id = ${id}`

    conn.query(query, function (err) {

        if (err) {
            console.log(err)
            return res.status(500).send('Erro ao atualizar o livro.');
        }

        res.redirect(`/book/${id}`)
    })
})

app.get('/book/:id', (req, res) => {
    const id = req.params.id

    const query = `SELECT * from BOOKS WHERE ID = ${id}`

    conn.query(query, function (err, data) {
        if (err) {
            console.log(err)
            return res.status(500).send('Erro ao visualizar o livro.');
        }
        const book = data[0]
        res.render('book', { book })
    })

})

app.post('/books/insertbook', (req, res) => {
    const title = req.body.title; // Corrigido para 'title'
    const pageqty = req.body.pagesqty; // Corrigido para 'pagesqty'

    //Vulneravel a SQL Injection
    //const query = `INSERT INTO BOOKS (nome, qtdPaginas) VALUES ('${title}', ${pageqty})`;

    const query = `INSERT INTO BOOKS (??, ??) VALUES (?, ?)`
    const values = ['nome', 'qtdPaginas', title, pageqty]

    conn.query(query, values, function (err) {
        if (err) {
            console.log(err);
            return res.status(500).send('Erro ao inserir o livro.'); // Resposta em caso de erro
        }
        res.redirect('/books');
    });
});

app.post('/book/remove/:id', (req, res) => {
    const id = req.params.id

    const query = `DELETE FROM books WHERE ID = ${id}`

    conn.query(query, function(err){
        if(err){
            console.log(err)
            return res.status(500).send('Erro ao deletar livro.'); // Resposta em caso de erro
        }

        res.redirect('/books')
    })
})

// Rota principal
app.get('/', (req, res) => {
    res.render('home');
});
