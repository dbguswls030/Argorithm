def init():
    top = -1
    stack.clear()

def is_empty():
    if top == -1:
        return True
    else:
        return False

def is_full():
    if top == MAX_STACK_SIZE-1:
        return True
    else:
        return False


def size():
    return len(stack)



def push(x):
    global top
    if is_full() == True:
        print("Error: stack is full")
    else:
        stack.append(x)
        top+=1

def pop():
    global top
    if is_empty() == True:
        print("Error: stack is empty")
    else:
        top-=-1
        return stack.pop()
        
def peek():
    if is_empty() == True:
        print("Error: stack is empty")
    else:
        return stack[top]


    

MAX_STACK_SIZE = 5
stack=[]
top = -1

init()
push(1)
print(stack)
push(2)
print(stack)
push(3)
print(stack)
print(pop())
print(stack)
print(pop())
print(pop())

print(size())
