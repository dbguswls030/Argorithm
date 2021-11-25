//
//  noteMain2.swift
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

    dc((0, arr.count), (0, arr.count))
    print(resultArr[0])
    print(resultArr[1])
    print(resultArr[2])
    func dc(_ width: (Int, Int), _ height: (Int, Int)){

        var dif = false
        let first = arr[width.0][height.0]
        for i in width.0..<width.1{
            for j in height.0..<height.1{
                if first != arr[i][j]{
                    dif = true
                    break
                }
            }
        }
        if dif == true{
            // (0, 9) (0, 9)
            let dx = (width.1 - width.0) / 3
            let dy = (height.1 - height.0) / 3
            dc((width.0, width.0+dx),(height.0, height.0+dy))
            dc((width.0, width.0+dx),(height.0+dy*1, height.0+dy*2))
            dc((width.0, width.0+dx),(height.0+dy*2, height.0+dy*3))
            dc((width.0+dx*1, width.0+dx*2),(height.0, height.0+dy))
            dc((width.0+dx*1, width.0+dx*2),(height.0+dy*1, height.0+dy*2))
            dc((width.0+dx*1, width.0+dx*2),(height.0+dy*2, height.0+dy*3))
            dc((width.0+dx*2, width.0+dx*3),(height.0, height.0+dy))
            dc((width.0+dx*2, width.0+dx*3),(height.0+dy*1, height.0+dy*2))
            dc((width.0+dx*2, width.0+dx*3),(height.0+dy*2, height.0+dy*3))
        }else{
            if first == -1{
                resultArr[0] += 1
            }else if first == 0{
                resultArr[1] += 1
            }else{
                resultArr[2] += 1
            }
        }

    }
}
solution()
