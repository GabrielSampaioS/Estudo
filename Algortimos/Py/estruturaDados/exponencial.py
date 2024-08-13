import time

##def expINteracao(n):

def expRec(n):
    if n <= 1:
        return n
    else:
        return  n* expRec(n-1)

##def expRec(n):


n = 10
start  = time.time()
print(expRec(n))
print('Recursive: {} seconds'.format(time.time() - start))