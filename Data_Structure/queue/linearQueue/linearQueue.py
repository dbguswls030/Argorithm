def enqueue(x):
    global rear
    rear+=1
    queue.insert(rear,x)

def dequeue():
    global rear
    if is_empty()==False:
        rear-=1
        return queue.pop(0)
    else:
        print("queue is empty")

def peek():
    return queue[0]

def size():
    return len(queue)

def is_empty():
    if rear == -1:
        return True
    else:
        return False

def init():
    global rear

    rear = -1
    queue.clear()


rear = -1
queue=[]

init()
enqueue(1)
print(queue)
enqueue(4)
print(queue)
print(dequeue())
print(queue)
print(peek())
enqueue(5)
print(queue)
print(peek())
print(size())
init()
print(queue)
