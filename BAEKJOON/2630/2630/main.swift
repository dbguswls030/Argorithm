//
//  main.swift
//  2630
//
//  Created by 유현진 on 2021/11/23.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var arr = [[Int]]()
    var white = 0
    var blue = 0
    for i in 0..<N{
        arr.append([Int]())
        arr[i] = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    }
    dc(Array(arr[0..<N][0..<N]))
    
    

    print(white)
    print(blue)
    
    func dc(_ list: [[Int]]){
        var blueFlag = true
        var whiteFlag = true
        for i in 0..<list.count{
            for j in 0..<list[i].count{
                if list[i][j] == 0{
                    blueFlag = false
                }
                if list[i][j] == 1 {
                    whiteFlag = false
                }
                if blueFlag == false && whiteFlag == false{
                    break
                }
                
            }
        }
        if blueFlag == true{
            blue += 1
            return
        }else if whiteFlag == true{
            white += 1
            return
        }
        else{
            if list.count >= 1{
                dc(divide(list, (0, list.count/2), (0, list.count/2)))
                dc(divide(list, (list.count/2, list.count), (0, list.count/2)))
                dc(divide(list, (0, list.count/2), (list.count/2, list.count)))
                dc(divide(list, (list.count/2, list.count), (list.count/2, list.count)))
            }
        }
    }
    func divide(_ list: [[Int]], _ width: (Int, Int), _ height: (Int, Int)) -> [[Int]]{
        var result = [[Int]]()
        for i in width.0..<width.1{
            result.append(Array(list[i][height.0..<height.1]))
        }
        
        return result
    }
}
solution()
