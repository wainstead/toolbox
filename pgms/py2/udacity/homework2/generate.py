tokens = {
        'ANDAND':       '&&',
        'COMMA':        ':',
        'DIVIDE':       '/',
        'ELSE':         'else',
        'EQUAL':        '=',
        'EQUALEQUAL':   '==',
        'FALSE':        'false',
        'FUNCTION':     'function',
        'GE':           '>=',
        'GT':           '>',
        'IF':           'if',
        'LBRACE':       '{',
        'LE':           '<=',
        'LPAREN':       '(',
        'LT':           '<',
        'MINUS':        '-',
        'NOT':          '!',
        'OROR':         '||',
        'PLUS':         '+',
        'RBRACE':       '}',
        'RETURN':       'return',
        'RPAREN':       ')',
        'SEMICOLON':    ';',
        'TIMES':        '*',
        'TRUE':         'true',
        'VAR':          'var',
}

keys = tokens.keys()
keys.sort()
for tok in keys:
    print """
def t_%s(token):
    r'%s'
    token.type = '%s'
    return token
""" % (tok, tokens[tok], tok)
