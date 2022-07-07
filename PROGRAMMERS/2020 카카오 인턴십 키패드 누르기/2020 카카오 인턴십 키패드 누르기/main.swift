//
//  main.swift
//  2020 카카오 인턴십 키패드 누르기
//
//  Created by 유현진 on 2022/07/07.
//

import Foundation

//print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
func solution(_ numbers:[Int], _ hand:String) -> String {
    var curL = (1,4)
    var curR = (3,4)
    let left = [1,4,7]
    let right = [3,6,9]
    let numDict = [1:(1,1), 2: (2,1), 3: (3,1), 4: (1,2), 5:(2,2), 6:(3,2), 7:(1,3), 8:(2,3), 9: (3,3), 0:(2,4)]
    var result = ""
    for i in numbers{
        if left.contains(i){
            curL = numDict[i]!
            result += "L"
        }else if right.contains(i){
            curR = numDict[i]!
            result += "R"
        }else{
            let returnHand = disMin(curL: curL, curR: curR, cur: numDict[i]!)
            if returnHand == "L"{
                curL = numDict[i]!
                result += "L"
            }else if returnHand == "R"{
                curR = numDict[i]!
                result += "R"
            }else{
                if hand == "left"{
                    curL = numDict[i]!
                    result += "L"
                }else{
                    curR = numDict[i]!
                    result += "R"
                }
            }
        }
    }
    return result
}

func disMin(curL: (Int, Int), curR: (Int, Int), cur: (Int, Int)) -> String{
    let disL = abs(cur.0 - curL.0) +  abs(cur.1 - curL.1)
    let disR = abs(cur.0 - curR.0) + abs(cur.1 - curR.1)
    if disL > disR{
        return "R"
    }else if disL < disR{
        return "L"
    }else{
        return "="
    }
}
