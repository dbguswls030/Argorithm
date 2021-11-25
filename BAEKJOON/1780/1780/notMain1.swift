//
//  notMain1.swift
//  1780
//
//  Created by 유현진 on 2021/11/25.
//

import Foundation
func solution(){
    let N = Int(readLine()!)!

    var arr = [[Int]]()

    for _ in 0..<N{
        arr.append(readLine()!.components(separatedBy: " ").map() {Int($0)!})
    }
    var resultArr = [0, 0, 0]
    dc(Array(arr[0..<N][0..<N]))
    for i in resultArr{
        print(i)
    }
    func dc(_ list: [[Int]]){
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
            let p1 = list.count/3
            let p2 = (list.count/3)*2
            let p3 = list.count
            dc(divide(list, (0, p1), (0, p1)))
            dc(divide(list, (0, p1), (p1, p2)))
            dc(divide(list, (0, p1), (p2, p3)))
            dc(divide(list, (p1, p2), (0, p1)))
            dc(divide(list, (p1, p2), (p1, p2)))
            dc(divide(list, (p1, p2), (p2, p3)))
            dc(divide(list, (p2, p3), (0, p1)))
            dc(divide(list, (p2, p3), (p1, p2)))
            dc(divide(list, (p2, p3), (p2, p3)))
        }else{
            switch list[0][0]{
            case -1:
                resultArr[0] += 1
            case 0:
                resultArr[1] += 1
            case 1:
                resultArr[2] += 1
            default:
                return
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
