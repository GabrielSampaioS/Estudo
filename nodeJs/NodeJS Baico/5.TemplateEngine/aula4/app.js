const express = require('express');
const exphbs = require('express-handlebars');

const app = express();

// Configura o motor de templates handlebars
app.engine('handlebars', exphbs.engine());
app.set('view engine', 'handlebars');


//Teste com repetição
app.get('/dashboard', (req, res) => {
    const itens = ['a','b', 'c']

    res.render('dashboard', {itens})

})


//teste com with
app.get('/post', (req, res) => {
    const post = {
        title: "aprendendo Node.js",
        category: "Javascript",
        body: "Este artigo",
        commentas: '4'
    }

    res.render('blogpost', {post})
})

// Rota para a página inicial
app.get('/', (req, res) => {

    const userDados = {
        name: 'Gabriel',
        subname: 'Sampaio'
    }

    //simular uma validação
    const auth = true

    res.render('home', {user : userDados, auth});
});

// Inicia o servidor
app.listen(3000, () => {
    console.log("App está rodando na porta 3000");
});
