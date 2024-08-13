class No:
    def __init__(self, valor):
        self.valor = valor
        self.proximo = None

class ListaEncadeada:
    def __init__(self):
        self.primeiro = None

    def adicionar(self, valor):
        novo_no = No(valor)
        if self.primeiro is None:
            self.primeiro = novo_no
        else:
            atual = self.primeiro
            while atual.proximo is not None:
                atual = atual.proximo
            atual.proximo = novo_no

    def imprimir(self):
        atual = self.primeiro
        while atual is not None:
            print(atual.valor)
            atual = atual.proximo