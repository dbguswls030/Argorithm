//
//  main.swift
//  deque
//
//  Created by 유현진 on 2021/06/24.
//

import Foundation


func initDeque(){
    linearDeque.removeAll()
}
func addFront(_ x: Int){
    if isFull()==false{
        linearDeque.insert(x, at: 0)
    }
}
func addRear(_ x: Int){
    if isFull() == false{
        linearDeque.append(x)
    }
    
}
func getFront() -> Int{
    if isEmpty() == false{
        return linearDeque[0]
    }else {
        return -1
    }
}
func getRear() -> Int{
    if isEmpty() == false{
        return linearDeque[linearDeque.count-1]
    }else{
        return -1
    }
}
func deleteFront() -> Int{
    if isEmpty() == false{
        return linearDeque.removeFirst()
    }
    else{
        return -1
    }
}
func deleteRear()->Int{
    if isEmpty() == false{
        return linearDeque.removeLast()
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
    if linearDeque.count == MAX_DEQUE_SIZE{
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
