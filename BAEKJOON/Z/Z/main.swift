//
//  main.swift
//  Z
//
//  Created by 유현진 on 2023/05/08.
//

import Foundation

func solution() -> Int{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let r = input[1] + 1
    let c = input[2] + 1
    let len = Int(pow(2.0, Float(N)))
    print(len)
    var count = 0
    func dc(size: Int, a: Int, b: Int){
        let row = size / 2
        let col = size / 2
        let x = a > row ? 1 : 0
        let y = b > col ? 1 : 0
        
        if x == 1 {
            count += row * size
        }
        if y == 1{
            count += col * row
        }
        
        if size > 4{
            print(count)
            dc(size: size/2, a: a/2, b: b/2)
        }else{
            print("zz",count)
            let aa = a/2
            let bb = b/2
            if aa == 1, bb == 1{
                count += 1
            }else if aa == 1,bb == 2 {
                count += 2
            }else if aa == 2, bb == 1{
                count += 3
            }else if aa == 2, bb == 2{
                count += 4
            }
            print(aa, bb)
        }
        
    }
    
    dc(size: len, a: r, b: c)
    
    
    return count
    
}
print(solution())
