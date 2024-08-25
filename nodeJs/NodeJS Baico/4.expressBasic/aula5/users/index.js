const express = require('express')
const path = require('path')

const router = express.Router()

const basePath = path.join(__dirname, '../templates')

router.get('/add', (req, res) =>{
    res.sendFile(`${basePath}/userform.html`)
})

// POST está no /userform.html
router.post('/save', (req, res) => {
    console.log(req.body)
    const name = req.body.name
    const email = req.body.email
    const msm = req.body.mensagem

    console.log(`Dados pegos: nome ${name}, email: ${email}, mensagem: ${msm}`)
    res.sendFile(`${basePath}/userform.html`)
})

module.exports = router
