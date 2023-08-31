//
//  main.swift
//  최댓값과 최솟값
//
//  Created by 유현진 on 2023/08/30.
//

import Foundation

func solution(_ s:String) -> String {
    let arr = s.split(separator: " ").map{Int($0)!}
    
    return "\(arr.min()!) \(arr.max()!)"
}
