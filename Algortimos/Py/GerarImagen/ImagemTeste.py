from PIL import Image
import random

WIDTH = 10
HEIGHT = 10
IMG = Image.new('RGB', (WIDTH, HEIGHT))

num_testes = 100  # Defina o número de testes desejado

valores = []

# Gerar números aleatórios para os testes e adicionar à lista
for _ in range(num_testes):
    numero1 = random.randint(1, 9)
    numero2 = random.randint(1, 9)
    valores = (numero1 / numero2)


# Criar a matriz com os valores
matriz = []
for row in range(HEIGHT):
    matriz.append([])
    for col in range(WIDTH):
        matriz[row].append(valores[row * WIDTH + col])

# Exibir a matriz no terminal
for row in matriz:
    print(row)

# Criar a imagem com base na matriz
pixel_set = IMG.load()
for row in range(HEIGHT):
    for col in range(WIDTH):
        xy = (col, row)
        
        # Obter o valor do pixel da matriz
        valor_pixel = matriz[row][col]
        
        # Define a intensidade de vermelho proporcional ao valor do pixel
        red = int(valor_pixel * 255)
        
        value = (red, 0, 0)
        IMG.putpixel(xy, value)

# Exibir a imagem
IMG.show()
