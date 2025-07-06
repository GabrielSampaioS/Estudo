# 📜 Introdução ao JavaScript — `var`, `let`, `const` e Hoisting

Com a chegada do ES6 (ECMAScript 2015), foram introduzidas as palavras-chave `let` e `const` como alternativas ao clássico `var`, proporcionando um controle mais preciso sobre o escopo e a mutabilidade das variáveis.

---

##  `var`: A forma clássica

Antes do ES6, todas as variáveis eram declaradas com `var`, o que causava alguns problemas de escopo e redefinição.

###  Escopo com `var`
- Tem **escopo global** se declarada fora de uma função.
- Tem **escopo de função** se declarada dentro de uma função.
- **Não respeita escopo de bloco `{}`.**

```javascript
var greeter = "hey hi";

function newFunction() {
    var hello = "hello";
}

console.log(greeter); // "hey hi"
console.log(hello);   // Erro: hello não está definido
```

###  Redeclaração e atualização
É possível **redeclará-la e atualizá-la** dentro do mesmo escopo.

```javascript
var greeter = "hey hi";
greeter = "say Hello instead";
```

### ⚠️ Problemas com `var`
```javascript
var greeter = "hey hi";
var times = 4;

if (times > 3) {
    var greeter = "say Hello instead";
}

console.log(greeter); // "say Hello instead"
```

A variável foi redefinida, mesmo fora do bloco `if`, pois `var` **ignora o escopo de bloco**.

---

##  `let`: Escopo de Bloco

- `let` respeita o **escopo de bloco `{}`**.
- Pode ser **atualizada**, mas **não redeclarada** dentro do mesmo escopo.

```javascript
let greeting = "say Hi";
let times = 4;

if (times > 3) {
    let hello = "say Hello instead";
    console.log(hello); // "say Hello instead"
}

console.log(hello); // Erro: hello não está definido
```

```javascript
let greeting = "say Hi";
greeting = "say Hello instead"; // OK
let greeting = "say Hello again"; // Erro: já declarado
```

 Pode haver **duas variáveis com mesmo nome em escopos diferentes**:

```javascript
let greeting = "say Hi";
if (true) {
    let greeting = "say Hello instead";
    console.log(greeting); // "say Hello instead"
}
console.log(greeting); // "say Hi"
```

---

##  `const`: Constantes

- Também tem **escopo de bloco**.
- **Não pode ser redeclarada nem atualizada**.
- **Deve ser inicializada na declaração.**

```javascript
const greeting = "say Hi";
greeting = "say Hello instead"; // Erro
const greeting = "say Hello instead"; // Erro
```

###  Objetos com `const`

```javascript
const greeting = {
    message: "say Hi",
    times: 4
};

greeting.message = "say Hello instead"; // ✅ Permitido
greeting = { text: "New" };             // ❌ Erro
```

---

##  Escopos em JavaScript

- **Global**: Fora de qualquer função ou bloco.
- **Função**: Dentro de uma função.
- **Bloco**: Dentro de `{}` (ex: `if`, `for`, etc).

---

## 🪄 Hoisting (Elevação)

O JavaScript move as **declarações** (não inicializações) para o topo do escopo antes da execução.

### 📌 Funções

```javascript
catName("Chloe");

function catName(name) {
  console.log("O nome do meu gato é " + name);
}
// Funciona pois a função é içada (hoisted)
```

###  Variáveis

```javascript
console.log(num); // undefined
var num = 6;
```

```javascript
num = 6;
console.log(num); // 6
var num;
```

### Exemplos adicionais

```javascript
// Exemplo 1 - Não hoista a inicialização
var x = 1;
console.log(x + " " + y); // '1 undefined'
var y = 2;

// Exemplo 2 - Hoisting com inicialização posterior
var num1 = 3;
num2 = 4;
console.log(num1 + " " + num2); // '3 4'
var num2;

// Exemplo 3 - Declarações depois, mas hoisting ocorre
a = "Cran";
b = "berry";
console.log(a + b); // 'Cranberry'
var a, b;
```

---

## 🔍 Sugestões para aprofundar

- `"var vs let vs const site:developer.mozilla.org"`
- `"JavaScript variable scoping ES6"`
- `"JavaScript hoisting explained"`
- `"temporal dead zone javascript"`

---

## 📚 Fontes

- [FreeCodeCamp - var, let e const](https://www.freecodecamp.org/portuguese/news/var-let-e-const-qual-e-a-diferenca/)
- [MDN Web Docs - Hoisting](https://developer.mozilla.org/pt-BR/docs/Glossary/Hoisting)
