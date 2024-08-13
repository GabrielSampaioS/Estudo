import time

def fatRec(n):
    if n < 2:
        return n
    else:
        return n * fatRec(n-1)
    
def fatIteracao(n):
    resp = n
    while(n >= 2):
        n -= 1
        resp *= n
    return resp
        

n = 500

start  = time.time()
print(fatRec(n))
print('Recursive: {} seconds'.format(time.time() - start))

start  = time.time()
print(fatIteracao(n))
print('Iterative: {} seconds'.format(time.time() - start))
