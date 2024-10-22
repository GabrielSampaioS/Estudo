// controllers/livroController.js
const Livro = require('../models/Livro');

exports.listarLivros = async (req, res) => {
    try{
        const livros = await Livro.getAll();
        res.render('livros/livros', {livros})
    } catch(err){
        console.error(err);
        res.status(500).send('Erro ao buscar livros')
    }

};

exports.CadastrarLivro = async (req, res) => {
    try{
        res.render('livros/CadastrarLivro')
    } catch(err){
        console.error(err);
        res.status(500).send('Erro ao buscar o furmulario de livros')
    }

};

exports.listaLivro = async (req, res) => {
    try{
        const id = req.params.id;
        const book = await Livro.getOne(id);
        res.render('livros/livro', {book})
    }catch(err){
        console.log(err);
        res.status(500).send('Erro ao buscar livro')
    }
};

exports.EditarLivro = async (req, res) => {
    try {
        const id = req.params.id;
        if (!id) {
            return res.status(400).send('ID do livro é necessário'); // Responde com erro se o ID não estiver presente
        }

        const book = await Livro.getOne(id)
        res.render('livros/EditarLivro', {book})
    } catch (err) {
        console.log(err);
        res.status(500).send('Erro ao editar');
    }
};

exports.InserirLivro = async (req, res) => {
    try {
        const title = req.body.title
        const pageqt = req.body.pagesqty

        try{
            Livro.create(title, pageqt)
            res.redirect('/livros'); 
        }catch (err){
            console.log(err)
        }


    }catch(err) {
        console.log(err)
        res.status(500).send('Erro ao inserir novo livro')
    }
};

exports.updatelivro = async(req, res) => {
    try{
        const title = req.body.title
        const pageqt = req.body.pagesqty
        const id = req.body.id

        try{
            Livro.update(title, pageqt, id)
            res.redirect('/livros'); 
        } catch {
            console.log(err)
        }
    } catch {
        console.log(err)
        res.status(500).send('Erro ao inserir novo livro')
    }

}

exports.deletarlivro = async (req, res) => {
    try {
        const id = req.params.id; // Use req.params.id
        await Livro.deleta(id);
        res.redirect('/livros');
    } catch (err) {
        console.log('Erro ao deletar livro:', err);
        res.status(500).send('Erro ao deletar o livro');
    }
};

