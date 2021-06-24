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
    linearDeque.removeAll()
}
func addFront(_ x: Int){
    if isFull()==false{
        if isEmpty()==true{
            linearDeque.append(x)
            front = (front+1) % MAX_DEQUE_SIZE
            rear = (rear+1) % MAX_DEQUE_SIZE
        }
        else{
            front = (front-1+MAX_DEQUE_SIZE) % MAX_DEQUE_SIZE
            linearDeque.insert(x, at: front)
            rear = (rear+1) % MAX_DEQUE_SIZE
        }
    }
}
func addRear(_ x: Int){
    if isFull() == false{
        rear=(rear+1) % MAX_DEQUE_SIZE
        linearDeque.append(x)
    }
    
}
func getFront() -> Int{
    if isEmpty() == false{
        return linearDeque[front]
    }else {
        return -1
    }
}
func getRear() -> Int{
    if isEmpty() == false{
        return linearDeque[rear]
    }else{
        return -1
    }
}
func deleteFront() -> Int{
    if isEmpty() == false{
        front = (front-1+linearDeque.count-1) % linearDeque.count
        return linearDeque.remove(at: front)
    }
    else{
        return -1
    }
}
func deleteRear()->Int{
    if isEmpty() == false{
        rear = (rear-1) % MAX_DEQUE_SIZE
        return linearDeque.remove(at: rear)
    }else{
        return -1
    }
}
func isEmpty() -> Bool{
    if linearDeque.isEmpty{
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
    return linearDeque.count
}

let MAX_DEQUE_SIZE = 10
var linearDeque:Array<Int> = []
var front = 0
var rear = 0




addFront(1)
print(linearDeque)
addRear(9)
print(linearDeque)
addFront(2)
print(linearDeque)
addRear(10)
print(linearDeque)
print(deleteRear())
print(linearDeque)
print(deleteRear())
print(linearDeque)
print(deleteFront())
print(linearDeque)
addRear(20)
print(linearDeque)
print(deleteFront())
print(linearDeque)
