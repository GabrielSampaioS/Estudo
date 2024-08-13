class Pilha():
    def __init__(self):
        self.data = []
    
    def push(self, x):
        self.data.append(x)

    def pop(self):
        if len(self.data) > 0:
            return self.data.pop(-1)
        
    def top(self):
        if len(self.data) > 0:
            return self.data[-1]
        
    def empty(self):
        return not len(self.data) > 0
    

    ##Realizar a conversão decimal para binário usando pilha

num = 550054654
p = Pilha()

while num > 0:
    x = num % 2
    p.push(x)
    num = num // 2 

while not p.empty():
    print(p.pop(), end='')