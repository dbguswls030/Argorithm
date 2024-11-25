//
//  main.swift
//  2116
//
//  Created by 유현진 on 11/21/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var diceList = [[Int]]()
    var result = 0
    for _ in 0..<N{
        diceList.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    func pairIndex(value: Int) -> Int{
        if value == 0{
            return 5
        }else if value == 1{
            return 3
        }else if value == 2{
            return 4
        }else if value == 4{
            return 2
        }else if value == 3{
            return 1
        }else{
            return 0
        }
    }
    
    for first in 1...6{
        var sum = 0
        var top = first
        for diceIndex in 0..<N{
            for (offset, bottom) in diceList[diceIndex].enumerated(){
                if top == bottom{
                    let newTop = diceList[diceIndex][pairIndex(value: offset)]
                    top = newTop
                    var tempDiceList = diceList[diceIndex]
                    tempDiceList.remove(at: tempDiceList.firstIndex(of: bottom)!)
                    tempDiceList.remove(at: tempDiceList.firstIndex(of: newTop)!)
                    sum += tempDiceList.max()!
                }
            }
        }
        result = max(result, sum)
    }
    print(result)
}
solution()


