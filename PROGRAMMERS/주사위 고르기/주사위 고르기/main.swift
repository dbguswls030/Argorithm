//
//  main.swift
//  주사위 고르기
//
//  Created by 유현진 on 3/12/25.
//

import Foundation
// 주사위 n/2개 씩 나누기
// 주사위 조합 만들기
// 최대 승리 수 업데이트 하기

func solution(_ dice:[[Int]]) -> [Int] {
    var maxWin = 0
    var result = [Int]()
    var combi = [[Int]]()
    
    func makeDiceCombination(index: Int, tempCombi: [Int]){
        if tempCombi.count == dice.count/2{ // 주사위 n/2개씩 나누기
            combi.append(tempCombi)
            return
        }
        
        for i in index..<dice.count{
            makeDiceCombination(index: i+1, tempCombi: tempCombi + [i+1])
        }
    }
    
    // 주사위 번호 조합으로 해당 번호의 주사위에서 나올 수 있는 수의 모든 경우의 합 만들기
    func makeSumCombination(dept: Int, leftDice: [Int], rightDice: [Int], leftSum: Int, rightSum: Int, leftScore: inout [Int], rightScore: inout [Int]){
        
        // 내가 가진 주사위들을 굴려서 나올 수 있는 합의 모든 경우를 구하기
        if dept == dice.count/2{
            leftScore.append(leftSum)
            rightScore.append(rightSum)
            return
        }
        
        for i in 0..<6{
            
            let leftNum = dice[leftDice[dept]-1][i]
            let rightNum = dice[rightDice[dept]-1][i]
            
            makeSumCombination(dept: dept+1, leftDice: leftDice, rightDice: rightDice, leftSum: leftSum+leftNum, rightSum: rightSum+rightNum, leftScore: &leftScore, rightScore: &rightScore)
        }
    }
    
    func getResult(leftCombi: [Int], rightCombi: [Int]){
        var leftScores = [Int]()
        var rightScores = [Int]()
        
        makeSumCombination(dept: 0, leftDice: leftCombi, rightDice: rightCombi, leftSum: 0, rightSum: 0, leftScore: &leftScores, rightScore: &rightScores)
        
        leftScores.sort()
        rightScores.sort()
        
        let leftWin = calcWinCountbinarySearch(leftScores: leftScores, rightScores: rightScores)
        let rightWin = calcWinCountbinarySearch(leftScores: rightScores, rightScores: leftScores)
        
        // 정답에서 요구하는 "승리 확률이 높은"은 오직 승리 수에만 영향이 있다.
        if leftWin > rightWin, maxWin < leftWin{
            maxWin = leftWin
            result = leftCombi
        }else if leftWin < rightWin, maxWin < rightWin{
            maxWin = rightWin
            result = rightCombi
        }
    }
    
    func calcWinCountbinarySearch(leftScores: [Int], rightScores: [Int]) -> Int{
        var leftWin = 0
        
        for leftScore in leftScores{
            var start = 0
            var end = rightScores.count-1
            var mid = (start + end) / 2
            
            while start<=end{
                mid = (start + end) / 2
                if leftScore > rightScores[mid]{
                    start = mid + 1
                }else {
                    end = mid - 1
                }
            }
            leftWin += start
        }
        return leftWin
    }
    
    makeDiceCombination(index: 0, tempCombi: [])
    
    for i in 0..<combi.count/2{
        let left = combi[i]
        let right = combi[combi.count/2..<combi.count].reversed()[i]
        
        getResult(leftCombi: left, rightCombi: right)
    }
    
    return result
}

print(solution([[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]))
//print(solution([[1, 2, 3, 4, 5, 6], [2, 2, 4, 4, 6, 6]]))
//print(solution([[40, 41, 42, 43, 44, 45], [43, 43, 42, 42, 41, 41], [1, 1, 80, 80, 80, 80], [70, 70, 1, 1, 70, 70]]))



//        var leftWin = 0
//        var rightWin = 0
//        
//        for left in leftScore {
//            for right in rightScore{
//                if left > right{
//                    leftWin += 1
//                }else if left < right{
//                    rightWin += 1
//                }
//            }
//        }
