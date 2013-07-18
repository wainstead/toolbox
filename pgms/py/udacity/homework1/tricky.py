# Title: Reading Machine Minds

# It can be difficult to predict what strings a finite state machine will
# accept. A tricky finite state machine may not accept any! A finite state
# machine that accepts no strings is said to be *empty*. 
# 
# In this homework problem you will determine if a finite state machine is
# empty or not. If it is not empty, you will prove that by returning a
# string that it accepts. 
#
# Formally, you will write a procedure nfsmaccepts() that takes four
# arguments corresponding to a non-derministic finite state machine:
#   the start (or current) state
#   the edges (encoded as a mapping)
#   the list of accepting states
#   a list of states already visited (starts empty) 
#
# If the finite state machine accepts any string, your procedure must
# return one such string (your choice!). Otherwise, if the finite state
# machine is empty, your procedure must return None (the value None, not
# the string "None"). 
#
# For example, this non-deterministic machine ...
edges = { (1, 'a') : [2, 3],
          (2, 'a') : [2],
          (3, 'b') : [4, 2],
          (4, 'c') : [5] }
accepting = [5] 
# ... accepts exactly one string: "abc". By contrast, this
# non-deterministic machine: 
edges2 = { (1, 'a') : [1],
           (2, 'a') : [2] }
accepting2 = [2] 
# ... accepts no strings (if you look closely, you'll see that you cannot
# actually reach state 2 when starting in state 1). 

# Hint #1: This problem is trickier than it looks. If you do not keep track
# of where you have been, your procedure may loop forever on the second
# example. Before you make a recursive call, add the current state to the
# list of visited states (and be sure to check the list of visited states
# elsewhere). 
#
# Hint #2: (Base Case) If the current state is accepting, you can return
# "" as an accepting string.  
# 
# Hint #3: (Recursion) If you have an outgoing edge labeled "a" that
# goes to a state that accepts on the string "bc" (i.e., the recursive call
# returns "bc"), then you can return "abc". 
#
# Hint #4: You may want to iterate over all of the edges and only consider
# those relevant to your current state. "for edge in edges" will iterate
# over all of the keys in the mapping (i.e., over all of the (state,letter)
# pairs) -- you'll have to write "edges[edge]" to get the destination list. 

def get_edge(statenum, edges):
    for edge in edges:
        if edge[0] == statenum:
           return edge

def make_return_string(visited, edges):
    string = ""
    #print "make_return_string: visited: %s" % visited
    for statenum in visited:
        edge = get_edge(statenum, edges)
        if edge[0] == 1: continue
        string += edge[1]
    return string

def nfsmaccepts(current, edges, accepting, visited):
    if not visited:
        visited = list()
    #else: print "visited: %s" % visited

    if current in accepting:
        return make_return_string(visited, edges)
    #else: print "%d not in %s" % (current, accepting)

    if current in visited:
        # we've been here before; didn't we advance the state in our
        # last iteration?
        #raise Exception("Visited the same state twice, tsk tsk")
        return None # spiral death trap

    # step through the DFSM, one edge at a time
    edge = get_edge(current, edges)
    visited.append(current)
    for nextedge in edges[edge]:
        #print "doing %d..." % nextedge
        result =  nfsmaccepts(nextedge, edges, accepting, visited)
        if result is None:
            #print "This path yielded nothing"
            continue
        return result
    # default fail whale
    return None

# This problem includes some test cases to help you tell if you are on
# the right track. You may want to make your own additional tests as well.
print "Test 1: " + str(nfsmaccepts(1, edges, accepting, []) == "abc")
print "Test 2: " + str(nfsmaccepts(1, edges, [4], []) == "ab") 
print "Test 3: " + str(nfsmaccepts(1, edges2, accepting2, []) == None) 
print "Test 4: " + str(nfsmaccepts(1, edges2, [1], []) == "")


