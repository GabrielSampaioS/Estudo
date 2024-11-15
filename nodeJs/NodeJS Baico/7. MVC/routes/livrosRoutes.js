const express = require('express');
const router = express.Router();
const livroController = require('../controllers/livroController');

// Rota para listar todos os livros
router.get('/', livroController.listarLivros);

// Rota para exibir a página de cadastro de um novo livro
router.get('/cadastrarlivro', livroController.CadastrarLivro);

// Rota para exibir a página de edição de um livro específico
router.get('/edit/:id', livroController.EditarLivro);

// Rota para buscar detalhes de um livro específico
router.get('/:id', livroController.listaLivro);

// Rota para adicionar um novo livro
router.post('/insertlivro', livroController.InserirLivro);

// Rota para atualizar um livro existente (melhor usar PUT para atualizações)
router.post('/updatelivro', livroController.updatelivro);

// Rota para apagar um livro
// Gambiarra deletar com POST ? PROVAVELMENTE SIM mas não consegui utilizar o method-override 
// SORRY 
router.post('/deletarlivro/:id', livroController.deletarlivro)

module.exports = router;
