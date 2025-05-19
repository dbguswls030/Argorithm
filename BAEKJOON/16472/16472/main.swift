//
//  main.swift
//  16472
//
//  Created by 유현진 on 5/14/25.
//

import Foundation

func solution() {
    let N = Int(readLine()!)!
    let translator = readLine()!.map { String ($0) }
    var left = 0
    var right = 0
    
    var knownSet = Set<String>()
    
    var result = 0

    while left <= right, right < translator.count - 1 {
        if knownSet.contains(translator[right + 1]) {
            right += 1
        } else {
            if knownSet.count < N {
                knownSet.insert(translator[right + 1])
                right += 1
            } else {
                var isEqual = false
                translator[left...right].enumerated().forEach {
                    if $0.offset != 0 {
                        if translator[left] == $0.element {
                            isEqual = true
                        }
                    }
                }
                if !isEqual {
                    knownSet.remove(translator[left])
                }
                
                left += 1
                if left > right {
                    swap(&left, &right)
                }
            }
        }
        result = max(result, (left...right).count)
        
        
    }
    print(result)
}
//func solution() {
//    let N = Int(readLine()!)!
//    let translator = readLine()!.map { String ($0) }
//    
//    var count = 0
//    var alphabetCount = Array(repeating: 0, count: 26)
//
//    var result = 0
//
//    var left = 0
//    var right = 0
//    
//    alphabetCount[Int(translator[left].unicodeScalars.first!.value) - 97] += 1
//    count += 1
//    
//    while right < translator.count - 1 {
//        right += 1
//        let rightIndex = Int(translator[right].unicodeScalars.first!.value) - 97
//        alphabetCount[rightIndex] += 1
//        if alphabetCount[rightIndex] == 1 {
//            count += 1
//        }
//        
//        while count > N {
//            let leftIndex = Int(translator[left].unicodeScalars.first!.value) - 97
//            alphabetCount[leftIndex] -= 1
//            if alphabetCount[leftIndex] == 0 {
//                count -= 1
//            }
//            left += 1
//        }
//        
//        result = max(result, right-left+1)
//    }
//    print(result)
//}

solution()
