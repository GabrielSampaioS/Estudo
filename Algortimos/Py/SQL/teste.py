import re

# SQL para análise
sql_query = """
SELECT     Status.*, TipoStatus.TipoStatus  FROM         Status INNER JOIN                        TipoStatus ON Status.CodigoTipoStatus = TipoStatus.CodigoTipoStatus  
"""

# Expressão regular 
pattern = r'\bJOIN\s+(\w+)\s+ON\s+(\w+)\.(\w+)\s*=\s*(\w+)\.(\w+)\b'

# correspondências na consulta SQL
matches = re.findall(pattern, sql_query, re.IGNORECASE)

# armazenar informações sobre chaves estrangeiras 
foreign_keys = []

# Iterar sobre as correspondências encontradas
for match in matches:
    table_left, col_left, table_right, col_right = match[1], match[2], match[3], match[4]
    
    # Considerar apenas se os nomes das colunas coincidem (um indício de FK)
    if col_left.lower() == col_right.lower():
        foreign_keys.append({
            'table_left': table_left,
            'column_left': col_left,
            'table_right': table_right,
            'column_right': col_right
        })

# Mostrar as chaves estrangeiras encontradas
for fk in foreign_keys:
    print(f"Tabela {fk['table_right']} possui {fk['column_right']} como FK referenciando {fk['table_left']}.{fk['column_left']}")
