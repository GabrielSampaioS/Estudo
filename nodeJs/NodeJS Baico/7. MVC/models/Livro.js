// models/Autor.js
const conn = require('../db/conn'); // Importa a conexão com o banco

class Livro {
    constructor(nome) {
        this.nome = nome;
    }

    // Método para obter todos os livros
    static async getAll() {
        const query = 'SELECT * FROM books'; 
        try {
            const [rows] = await conn.promise().query(query); // Executa a consulta e aguarda o resultado
            return rows; // Retorna os resultados
        } catch (err) {
            console.error(err);
            throw new Error('Erro ao buscar livros');
        }
    }

    static async getOne(id){
        const query  = 'SELECT * FROM books where ID = ?'
        try{
            const [rows] = await conn.promise().query(query , id);
            return rows[0];
        }catch(err) {
            console.log(err);
            throw new Error ('Erro ao buscar livro');
        }
    }

    // Método para criar um novo livro
    static async create(title, pageqt) {
        const query = 'INSERT INTO books (nome, qtdPaginas) VALUES (?, ?)'; 
        try {
            // Passa os parâmetros como um array
            await conn.promise().query(query, [title, pageqt]); 
            
        } catch (err) {
            console.error(err);
            throw new Error('Erro ao adicionar livro');
        }
    }

    static async update(title, pageqt, id){

        const query = 'UPDATE books SET nome = ?, qtdPaginas = ? WHERE id = ?';


        try{
            await conn.promise().query(query, [title, pageqt, id]);
        } catch (err) {
            console.log('erro ao autilizar livrro')
            console.log(err)
        }

    }
    static async deleta(id) {
        const query = 'DELETE FROM books WHERE id = ?';
        try {
            await conn.promise().query(query, [id]);
        } catch (err) {
            console.log('Erro ao deletar livro:', err);
        }
    }
    
}

module.exports = Livro;
