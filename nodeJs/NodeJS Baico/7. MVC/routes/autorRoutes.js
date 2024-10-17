// routes/autorRoutes.js
const express = require('express');
const router = express.Router();
const autorController = require('../controllers/autorController');

router.get('/', autorController.listarAutores); // Rota para listar autores
router.post('/adicionar', autorController.adicionarAutor); // Rota para adicionar autor

module.exports = router;
