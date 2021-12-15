//
//  main.swift
//  2580
//
//  Created by 유현진 on 2021/12/14.
//

import Foundation
solution()
func solution(){
    var b = [[Int]]()
    Input()
    bt(0)
    
    func bt(_ c: Int){
        let x = c/9
        let y = c%9
        if c == 81 {
            print("")
            Print()
            exit(0)
        }
        if b[x][y] == 0{
            for i in 1...9{
                if row(y,i) && col(x,i) && square((x,y),i){
                    b[x][y] = i
                    bt(c+1)
                    b[x][y] = 0
                }
            }
        }else{
            bt(c+1)
            
        }
        
    }

    func row(_ index: Int, _ n: Int) -> Bool{
        for i in 0..<9{
            if b[i][index] == n{
                return false
            }
        }
        return true
    }
    
    func col(_ index: Int, _ n: Int) -> Bool{
        for i in 0..<9{
            if b[index][i] == n{
                return false
            }
        }
        return true
    }
    
    func square(_ index: (Int, Int), _ n: Int) -> Bool{
        let idx = index.0/3
        let idy = index.1/3
        //print(index.0, index.1)
        for p in 3*idx..<3*idx+3{
            for q in 3*idy..<3*idy+3{
                if b[p][q] == n{
                    return false
                }
            }
        }
        return true
    }
    func Input(){
        for _ in 0..<9{
            b.append(readLine()!.components(separatedBy: " ").map() {Int($0)!})
        }
    }
    func Print(){
        for i in 0..<b.count{
            for j in 0..<b.count{
                print(b[i][j],terminator: " ")
            }
            print("")
        }
    }
}
