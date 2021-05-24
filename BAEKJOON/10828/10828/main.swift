//
//  main.swift
//  10828
//
//  Created by 유현진 on 2021/05/24.
//

import Foundation

var N = Int(readLine()!)!

var stack = [Int]()
var top = -1



func size() -> Int{
    return stack.count
}

func empty()->Int{
    if top == -1{
        return 1
    }
    else{
        return 0
    }
}

func push(_ x: Int){
    stack.append(x)
    top+=1
}

func pop() -> Int{
    if empty() == 1{
        return -1
    }else{
        top -= 1
        return stack.removeLast()
    }
}


func peek() -> Int{
    if empty() == 1{
        return -1
    }else{
        return stack[top]
    }
}


for _ in 0..<N{
    var input = readLine()!
    switch input {
    case "top":
        print(peek())
    case "size":
        print(size())
    case "empty":
        print(empty())
    case "pop":
        print(pop())
    default:
        var s = input.components(separatedBy: " ")
        
        push(Int(s[1])!)
    }
}
