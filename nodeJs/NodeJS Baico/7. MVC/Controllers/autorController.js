// controllers/autorController.js
const Autor = require('../models/Autor');

exports.listarAutores = async (req, res) => {
    try {
        const autores = await Autor.getAll();
        res.render('autor/autores', { autores });
    } catch (error) {
        console.error(error);
        res.status(500).send('Erro ao buscar autores');
    }
};

exports.adicionarAutor = async (req, res) => {
    const { nome } = req.body;
    try {
        const novoAutor = await Autor.create(nome);
        res.redirect('/autores'); // Redireciona para a lista de autores
    } catch (error) {
        console.error(error);
        res.status(500).send('Erro ao adicionar autor');
    }
};
