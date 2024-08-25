const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path')
const app = express();

//definir partials
const hbs = exphbs.create({
    partialsDir: ['views/partials'],
})

// Configura o motor de templates handlebars
// para urtilizar o partials iremos retirar o 'exphbs.engine()'
//app.engine('handlebars', exphbs.engine());
app.engine('handlebars', hbs.engine)
app.set('view engine', 'handlebars');


//app.use(express.static('public'))
app.use(express.static(path.join(__dirname,'public')))



//Teste com repetição
app.get('/dashboard', (req, res) => {
    const itens = ['a','b', 'c']

    res.render('dashboard', {itens})

})


//teste com with utilizamos o blogpost.handlebars
app.get('/post', (req, res) => {
    const post = {
        title: "aprendendo Node.js",
        category: "Javascript",
        body: "Este artigo",
        commentas: '4'
    }

    res.render('blogpost', {post})
})

// aula 5, teste utilizamos o blog.handlebars
app.get('/blog', (req, res) => {
    const posts = [
        {
            title: "Aprendendo NJ",
            category: "Programação",
            body: "POST",
            comments: "1"
        },
        {
            title: "Introdução ao JavaScript",
            category: "Programação",
            body: "Neste post, exploramos os conceitos básicos do JavaScript.",
            comments: "3"
        },
        {
            title: "Dicas de Fotografia",
            category: "Fotografia",
            body: "Aqui estão algumas dicas para melhorar suas habilidades fotográficas.",
            comments: "5"
        },
        {
            title: "Como montar um PC para jogos",
            category: "Tecnologia",
            body: "Um guia passo a passo para montar um PC de alto desempenho para jogos.",
            comments: "8"
        },
        {
            title: "Receitas de Smoothies Saudáveis",
            category: "Culinária",
            body: "Descubra receitas deliciosas e saudáveis para smoothies.",
            comments: "2"
        },
        {
            title: "Melhores Práticas de SEO em 2024",
            category: "Marketing Digital",
            body: "Dicas e técnicas atualizadas para otimizar seu site para motores de busca.",
            comments: "4"
        }
    ];
    
    res.render('blog', {posts} )
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
