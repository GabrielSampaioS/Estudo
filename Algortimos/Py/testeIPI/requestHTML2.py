from urllib.request import urlopen
from html.parser import HTMLParser

class MyParser(HTMLParser):

    def __init__(self):
        super().__init__()  # Uso do super() para chamar o inicializador da classe base
        self.n_polos = 0

    def handle_starttag(self, tag, attrs):
        if tag == 'p':
            for attr in attrs:
                if attr[0] == 'class' and attr[1] == 'color-primary cidade':
                    self.n_polos += 1
                    print(attr)

def getSource(url):
    response = urlopen(url)
    html = response.read()
    return html.decode()

url = "https://univesp.br/polos"
html = getSource(url)

parser = MyParser()
parser.feed(html)
print(f"Número de polos: {parser.n_polos}")
