const express = require('express')
const app = express()
const port = 3000
const path = require('path')

const usersRoutes = require('./users')

// Ler o body
app.use(
    express.urlencoded({
        extended: true,
    }),
)

// Transformando todos os dados em JSON para poder ler
app.use(express.json())

//arquivos estáticos 
app.use(express.static(path.join(__dirname,'public')))

const basePath = path.join(__dirname, 'templates')

app.use('/users', usersRoutes)

app.get('/', (req, res) => {
    res.sendFile(`${basePath}/userform.html`)
})

//Midel
app.use(function(req, res, next){
    res.status(404).sendFile(`${basePath}/404.html`)
})

app.listen(port, () => {
    console.log(`O servidor está na porta ${port}`)
})
