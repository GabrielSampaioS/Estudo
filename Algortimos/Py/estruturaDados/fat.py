def f(n):
    if n == 0:
        return 1
    else:
        return n * f(n-1)

def fat(n):
    if n == 0:
        return 1
    else:
        res = n * fat(n - 1)
        return res

print (fat(7))