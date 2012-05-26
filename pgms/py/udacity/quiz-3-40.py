# Expanding Exp
# This is very, very difficult.

grammar = [ 
    ("exp", ["exp", "+", "exp"]),
    ("exp", ["exp", "-", "exp"]),
    ("exp", ["(", "exp", ")"]),
    ("exp", ["num"]),
    ]


def expand(tokens, grammar):
    for pos in range(len(tokens)):
        for rule in grammar:
            # hmmmm
            # if tokens[pos] == 'exp':  this was wrong, though it worked... need to match the lhs value, like so:
            if tokens[pos] == rule[0]: # this is the same thing except we have flexibility
                yield tokens[0:pos] + rule[1]
            
            
depth = 1
utterances = [["exp"]]
utterances =  [['exp'],
               [('exp', ['exp', '+', 'exp']),
                ('exp', ['exp', '-', 'exp']),
                ('exp', ['(', 'exp', ')']),
                ('exp', ['num'])]
               ]
# utterances = [["a", "exp"]]
for x in range(depth):
    for sentence in utterances:
        utterances = utterances + [ i for i in expand(sentence, grammar)]

for sentence in utterances:
    print sentence
    
#    ['exp']
#    ['exp', '+', 'exp']
#    ['exp', '-', 'exp']
#    ['(', 'exp', ')']
#    ['num']
