//
//  main.swift
//  후보키
//
//  Created by 유현진 on 2023/08/24.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    var visited = Set<[Int]>()
    var result = 0
    var indexList = [[Int]]()
    let colLen = relation[0].count
    let rowLen = relation.count
    func checkMinimality(checkList: [Int]) -> Bool{
//        print(checkList)
//        print(visited)
        for v in visited{
            
            var index = 0
            while index < v.count{
                if !checkList.contains(v[index]){
                    break
                }
                index += 1
            }
            if index == v.count{
//                print("false \(v) - \(checkList)")
                return false
            }
            
            
        }
//        print("true \(checkList)")
        return true
    }
    func dfs(list: [Int], len: Int, visited: [Bool]){
        if len == 0{
            indexList.append(list)
            return
        }
        var list = list
        var visited = visited
        for i in 0..<colLen{
            if visited[i] == false{
                visited[i] = true
                list.append(i)
                dfs(list: list, len: len-1, visited: visited)
                list.removeLast()
            }
        }
    }
    
    for i in 1...colLen{
        dfs(list: [], len: i, visited: Array(repeating: false, count: colLen))
    }
    
    for list in indexList {
        var tempKeys = Set<String>()
        
        for row in 0..<rowLen{
            var key = ""
            for col in list{
                key += relation[row][col]
            }
            tempKeys.insert(key)
        }
        
        if tempKeys.count == rowLen{ // 유일성 만족
            if checkMinimality(checkList: list){
                result += 1
                visited.insert(list)
            }
        }
    }
    return result
}
print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
print(solution([["100","100","ryan","music","2"], ["200","200","apeach","math","2"], ["300","300","tube","computer","3"], ["400","400","con","computer","4"], ["500","500","muzi","music","3"], ["600","600","apeach","music","2"]]))
print(solution([["a","b","c"], ["1","b","c"], ["a","b","4"],["a","5","c"]]))
print(solution([["a","1","4"], ["2","1","5"], ["a","2","4"]]))

print(solution([["a","1","aaa","c","ng"],
                ["b","1","bbb","c","g"],
                ["c","1","aaa","d","ng"],
                ["d","2","bbb","d","ng"]]))

print(solution([["a","1","aaa","c","ng"],
    ["a","1","bbb","e","g"],
    ["c","1","aaa","d","ng"],
    ["d","2","bbb","d","ng"]]))
