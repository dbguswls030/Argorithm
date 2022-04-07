//
//  main.swift
//  10430
//
//  Created by 유현진 on 2022/04/07.
//

//(A+B)%C는 ((A%C) + (B%C))%C 와 같을까?
//
//(A×B)%C는 ((A%C) × (B%C))%C 와 같을까?
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let A = input[0]
    let B = input[1]
    let C = input[2]
    
    print((A+B)%C)
    print(((A%C) + (B%C))%C)
    print((A*B)%C)
    print(((A%C) * (B%C))%C)
}

solution()
