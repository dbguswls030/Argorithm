//
//  main.swift
//  1992
//
//  Created by 유현진 on 2021/11/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var arr = [[String]]()
    for _ in 0..<N{
        arr.append(readLine()!.map({String($0)}))
    }
    dc(Array(arr[0..<N][0..<N]))
     

    func dc(_ list: [[String]]){
        var dif = false
        for i in 0..<list.count{
            for j in 0..<list[i].count{
                if list[0][0] != list[i][j]{
                    dif = true
                    break
                }
            }
        }
        if dif == true{
            if list.count > 1{
                print("(", terminator: "")
                dc(divide(list, (0, list.count/2), (0, list.count/2)))
                dc(divide(list, (0, list.count/2), (list.count/2, list.count)))
                dc(divide(list, (list.count/2, list.count), (0, list.count/2)))
                dc(divide(list, (list.count/2, list.count), (list.count/2, list.count)))
                print(")", terminator: "")
            }
        }else{
            print(list[0][0], terminator: "")
        }
    }
    
    func divide(_ list: [[String]], _ width: (Int, Int), _ heigth: (Int, Int)) -> [[String]]{
        var result = [[String]]()
        for i in width.0..<width.1{
            result.append(Array(list[i][heigth.0..<heigth.1]))
        }
        return result
    }
}
solution()
