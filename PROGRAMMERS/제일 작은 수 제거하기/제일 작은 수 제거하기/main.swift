//
//  main.swift
//  제일 작은 수 제거하기
//
//  Created by 유현진 on 2023/02/15.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    let m = arr.min()
    var result = arr.filter{$0 != m}
    return result.isEmpty ? [-1] : result
}
