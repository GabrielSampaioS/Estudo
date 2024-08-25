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

const basePath = path.join(__dirname, 'templates')

app.use('/users', usersRoutes)

app.get('/', (req, res) => {
    res.sendFile(`${basePath}/userform.html`)
})

app.listen(port, () => {
    console.log(`O servidor está na porta ${port}`)
})
