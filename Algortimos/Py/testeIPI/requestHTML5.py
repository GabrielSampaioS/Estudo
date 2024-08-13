from urllib.request import urlopen
from html.parser import HTMLParser

class MyParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            for attr in attrs:
                if attr[0] == 'href':
                    print(attr[1])  # Corrigido para usar o índice correto
        

def getSource(url):
    response = urlopen(url)
    html = response.read()
    return html.decode()

# Exemplo de uso
for i in range(1, 8):  # Python loop for range 1 to 7 inclusive
    paginaAtual = i
    url = 'https://www.sp.senai.br/cursos/cursos-livres/mecanica-automotiva?pag={}'.format(paginaAtual)
    print(url)
    
    html = getSource(url)

    parser = MyParser()
    parser.feed(html)
    
    input('Pressione Enter para continuar...')  # Mudança de mensagem
