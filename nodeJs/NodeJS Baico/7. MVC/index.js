const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path'); 
//const conn = require('./db/conn'); 

const app = express();

// Define partials
const hbs = exphbs.create({
    partialsDir: ['views/partials'],
});

app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

app.use(
    express.urlencoded({
        extended: true // To parse URL-encoded bodies
    })
);

app.use(express.json());
// FIM -- Define partials

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

// Start the server
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
