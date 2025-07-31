async function infoPais(name) {
    const url = 'https://restcountries.com/v3.1/name/' + name
    const response = await fetch(url)
    
    const retorno = await response.json()

    const NomeOficial = retorno.name.official

    console.log(NomeOficial)
}

console.log('testando função async')
infoPais('brasil')
