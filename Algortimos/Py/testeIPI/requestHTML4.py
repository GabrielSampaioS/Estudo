from urllib.request import urlopen

def get_pdf_bytes(url):
    response = urlopen(url)
    pdf_bytes = response.read()
    return pdf_bytes

def save_pdf_bytes(file_path, pdf_bytes):
    with open(file_path, 'wb') as file:
        file.write(pdf_bytes)

# Exemplo de uso
url = "http://www.infoconsumo.gov.br/laboratorios/rble/docs/CLC0006.pdf"
pdf_bytes = get_pdf_bytes(url)

# Imprimir os primeiros 100 bytes do PDF para ver como são os dados brutos
print(pdf_bytes)

# Salvar os bytes em um novo arquivo
save_pdf_bytes("downloaded.pdf", pdf_bytes)
