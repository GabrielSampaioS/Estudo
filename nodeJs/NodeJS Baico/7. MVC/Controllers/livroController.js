// controllers/livroController.js
const Livro = require('../models/Livro');

exports.listarLivros = async (req, res) => {
    try{
        const livros = await Livro.getAll();
        res.render('livros/livros', {livros})
        console.log(livros)
    } catch(err){
        console.error(err);
        res.status(500).send('Erro ao buscar livros')
    }

};
