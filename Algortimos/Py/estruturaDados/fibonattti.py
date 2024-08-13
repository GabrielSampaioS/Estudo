import time

def fibRec(n):
    if n <= 1:
        return n
    else:
        return fibRec(n-1) + fibRec(n-2)

def fibIteracao(n):
    if n <= 1:
        return n
    a, b = 0, 1
    for _ in range(2, n+1):
        a, b = b, a + b
    return b

def fibMap(n, memo={}):
    if n <= 1:
        return n
    elif n not in memo:
        memo[n] = fibMap(n-1, memo) + fibMap(n-2, memo)
    return memo[n]

n = 15

start = time.time()
print("Recursive:", fibRec(n))
print('Recursive Time: {:.6f} seconds'.format(time.time() - start))

start = time.time()
print("Iterative:", fibIteracao(n))
print('Iterative Time: {:.6f} seconds'.format(time.time() - start))

start = time.time()
print("Memoization:", fibMap(n))
print('Memoization Time: {:.6f} seconds'.format(time.time() - start))
