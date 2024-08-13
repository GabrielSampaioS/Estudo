from urllib.request import urlopen, Request
from html.parser import HTMLParser

class MyParser(HTMLParser):

    def __init__(self):
        super().__init__()  # Chama o inicializador da classe base
        self.in_target_p = False  # Indicador se estamos dentro da tag <p> alvo
        self.polos = []  # Lista para armazenar os nomes das cidades
        self.n_polos = 0  # Contador para o número de tags <p> alvo

    def handle_starttag(self, tag, attrs):
        if tag == 'p':
            for attr in attrs:
                if attr[0] == 'class' and attr[1] == 'item-polos':
                    self.in_target_p = True
                    self.n_polos += 1

    def handle_endtag(self, tag):
        if tag == 'p' and self.in_target_p:
            self.in_target_p = False

    def handle_data(self, data):
        if self.in_target_p:
            self.polos.append(data.strip())  # Adiciona o nome da cidade à lista

def getSource(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3'
    }

    req = Request(url=url, headers=headers)
    response = urlopen(req)
    html = response.read()
    return html.decode()

url = "https://univesp.br/cursos/engenharia-de-computacao"
html = getSource(url)

parser = MyParser()
parser.feed(html)

print(f"Número de polos: {parser.n_polos}")
for polo in parser.polos:
    print(polo)
