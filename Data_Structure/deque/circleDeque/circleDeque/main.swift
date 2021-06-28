//
//  main.swift
//  circleDeque
//
//  Created by 유현진 on 2021/06/24.
//

import Foundation



func initDeque(){
    front = -1
    rear = -1
    circleDeque.removeAll()
}
func addFront(_ x: Int){
    if isFull()==false{
        if isEmpty()==true{
            circleDeque.append(x)
            front = (front+1) % MAX_DEQUE_SIZE
            rear = (rear+1) % MAX_DEQUE_SIZE
        }
        else{
            front = (front-1+MAX_DEQUE_SIZE) % MAX_DEQUE_SIZE
            circleDeque.insert(x, at: front)
            rear = (rear+1) % MAX_DEQUE_SIZE
        }
    }
}
func addRear(_ x: Int){
    if isFull() == false{
        rear=(rear+1) % MAX_DEQUE_SIZE
        circleDeque.append(x)
    }
    
}
func getFront() -> Int{
    if isEmpty() == false{
        return circleDeque[front]
    }else {
        return -1
    }
}
func getRear() -> Int{
    if isEmpty() == false{
        return circleDeque[rear]
    }else{
        return -1
    }
}
func deleteFront() -> Int{
    if isEmpty() == false{
        front = (front-1+circleDeque.count-1) % circleDeque.count
        return circleDeque.remove(at: front)
    }
    else{
        return -1
    }
}
func deleteRear()->Int{
    if isEmpty() == false{
        rear = (rear-1) % MAX_DEQUE_SIZE
        return circleDeque.remove(at: rear)
    }else{
        return -1
    }
}
func isEmpty() -> Bool{
    if circleDeque.isEmpty{
        print("deque is empty")
        return true
    }else{
        return false
    }
}
func isFull() -> Bool{
    if front == (rear+1)%MAX_DEQUE_SIZE{
        print("deque is full")
        return true
    }else{
        return false
    }
}
func size() -> Int{
    return circleDeque.count
}

let MAX_DEQUE_SIZE = 10
var circleDeque:Array<Int> = []
var front = 0
var rear = 0




addFront(1)
print(circleDeque)
addRear(9)
print(circleDeque)
addFront(2)
print(circleDeque)
addRear(10)
print(circleDeque)
print(deleteRear())
print(circleDeque)
print(deleteRear())
print(circleDeque)
print(deleteFront())
print(circleDeque)
addRear(20)
print(circleDeque)
print(deleteFront())
print(circleDeque)
