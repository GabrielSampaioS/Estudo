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
url = "https://www.facebook.com/business"
html = getSource(url)

parser = MyParser()
parser.feed(html)
