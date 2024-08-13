class S: 
    def __init__(self): 
        self.v = [ ] 
        self.i = -1 
 
    def push(self, x): 
        self.i += 1 
        self.v.append(x) 
 
    def pop(self): 
        if(not self.empty()): 
            self.i -= 1 
            return self.v.pop() 
 
    def empty(self): 
        return self.i < 0 
 
 
s = S() 
for i in range(10): 
    s.push(i) 
 
while not s.empty(): 
    print(s.pop()) 