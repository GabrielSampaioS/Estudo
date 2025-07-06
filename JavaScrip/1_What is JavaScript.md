# 📜 Introdução ao JavaScript

JavaScript é uma linguagem de programação interpretada que permite implementar funcionalidades complexas em páginas web — como atualizações de conteúdo em tempo real, mapas interativos, gráficos animados em 2D/3D, controle de multimídia, entre outros.

>  Em resumo: JavaScript transforma uma página estática em algo interativo e dinâmico.

---

##  Exemplo Básico: HTML + CSS + JavaScript

###  Botão HTML

```html
<button type="button">Player 1: Chris</button>
```

### Estilização com CSS

```css
button {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
  letter-spacing: 1px;
  text-transform: uppercase;
  border: 2px solid rgba(200, 200, 0, 0.6);
  background-color: rgba(0, 217, 217, 0.6);
  color: rgb(100, 0, 0);
  box-shadow: 1px 1px 2px rgba(0, 0, 200, 0.4);
  border-radius: 10px;
  padding: 3px 10px;
  cursor: pointer;
}
```

###  Interatividade com JavaScript

```javascript
function updateName() {
  const name = prompt("Enter a new name");
  button.textContent = `Player 1: ${name}`;
}

const button = document.querySelector("button");
button.addEventListener("click", updateName);
```

>  Esse é apenas o **básico do básico**. Com JavaScript, podemos fazer muito mais!

---

##  O que você pode fazer com JavaScript?

- Armazenar valores em variáveis
- Executar código em resposta a eventos
- Alterar dinamicamente HTML e CSS (DOM)
- Controlar mídias (vídeos, áudios, imagens)
- Fazer requisições a servidores (AJAX, Fetch)
- Criar jogos, apps e animações

---

##  Como o JavaScript é executado?

Ao abrir uma página web no navegador, o código (HTML + CSS + JavaScript) é executado em um **ambiente de execução** (a aba do navegador).

![alt text](/img/image.png)

Cada aba funciona de forma **isolada**, garantindo segurança. Ou seja, o código de uma aba não interfere diretamente em outra.

---

##  Interpretado vs Compilado

###  Interpretado

- O código é executado linha por linha, diretamente do texto fonte.
- Exemplo: **JavaScript**

###  Compilado

- O código é transformado em binário antes de ser executado.
- Exemplo: **C/C++**

> Apesar de JavaScript ser interpretado, navegadores modernos utilizam técnicas de **compilação just-in-time (JIT)** para melhorar a performance. Ou seja, o código é convertido em binário **enquanto** é executado.

---

## 📍Código Cliente vs Servidor

| Tipo                  | Executado em...      | Linguagens comuns        |
|-----------------------|----------------------|--------------------------|
| **Lado do Cliente**   | Navegador do usuário | JavaScript               |
| **Lado do Servidor**  | Servidor Web         | PHP, Python, Ruby, C#, Node.js |

>  O JavaScript pode ser usado **nos dois lados**, inclusive com **Node.js** no backend.

---

##  Código Estático vs Dinâmico

- **Estático**: Não muda sem recarregar a página (ex: HTML puro)
- **Dinâmico**: Pode mudar interativamente (ex: com JavaScript)

---

##  Estratégias de Carregamento de Scripts

###  Boas práticas:

1. **Colocar o `<script>` no final do `<body>`**:
   - Assim, o HTML é carregado antes do JS.

2. **Usar `<script type="module">` no `<head>`**:
   - Garante que o JavaScript será executado **após** o carregamento do HTML.


## Fontes 
https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript