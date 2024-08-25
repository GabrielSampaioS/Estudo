const express = require('express');
const exphbs = require('express-handlebars');

const app = express();

// Configura o motor de templates handlebars
app.engine('handlebars', exphbs.engine());
app.set('view engine', 'handlebars');

// Rota para a página inicial
app.get('/', (req, res) => {
    res.render('home');
});

// Inicia o servidor
app.listen(3000, () => {
    console.log("App está rodando na porta 3000");
});
