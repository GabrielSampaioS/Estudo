// models/Autor.js
const conn = require('../db/conn'); // Importa a conexão com o banco

class Autor {
    constructor(nome) {
        this.nome = nome;
    }

    // Método para obter todos os livros
    static async getAll() {
        const query = 'SELECT * FROM books'; // Consulta corrigida para 'autores'
        try {
            const [rows] = await conn.promise().query(query); // Executa a consulta e aguarda o resultado
            return rows; // Retorna os resultados
        } catch (err) {
            console.error(err);
            throw new Error('Erro ao buscar livros');
        }
    }

    // Método para criar um novo autor
    static async create(nome) {
        const query = 'INSERT INTO autores (nome) VALUES (?)'; // Ajuste para o placeholder correto
        try {
            const [result] = await conn.promise().query(query, [nome]); // Usa o método promise() e aguarda
            return result.insertId; // Retorna o ID do autor inserido
        } catch (err) {
            console.error(err);
            throw new Error('Erro ao adicionar autor');
        }
    }
}

module.exports = Autor;
