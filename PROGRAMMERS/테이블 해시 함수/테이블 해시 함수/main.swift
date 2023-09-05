//
//  main.swift
//  테이블 해시 함수
//
//  Created by 유현진 on 2023/09/05.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data
    data.sort{ a, b in
        return a[col-1] == b[col-1] ? a[0] > b[0] : a[col-1] < b[col-1]
    }
    var si = [Int]()
    for i in row_begin-1..<row_end{
        var num = 0
        for j in 0..<data[i].count{
            num += data[i][j] % (i+1)
        }
        si.append(num)
    }
    return 0
}

print(solution([[2,2,6],[1,5,10],[4,2,9],[3,8,3]], 2, 2, 3))
