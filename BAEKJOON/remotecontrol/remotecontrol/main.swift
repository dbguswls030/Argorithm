//
//  main.swift
//  remotecontrol
//
//  Created by 유현진 on 10/14/24.
//
// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
import Foundation

func solution1(){
    var curChannelArray = [Int]()
    let targetChannel = readLine()!.map{ Int(String($0))! }
    var buttons = Array(repeating: true, count: 11)
    
    let M = Int(readLine()!)!
    var brokenButtons = [Int]()
    if M != 0 {
        brokenButtons = readLine()!.split(separator: " ").map{ Int(String($0))! }
        for i in brokenButtons{
            buttons[i] = false
        }
    }
    
    var result = abs(100 - Int(targetChannel.map{ String($0) }.joined())!)
    
    for num in 0..<1000000{
        let strNum = String(num).map{Int(String($0))!}
        for index in 0..<strNum.count{
            if buttons[strNum[index]] == false{
                break
            }
            if index == strNum.count-1{
                result = min(result, abs(num-Int(targetChannel.map{ String($0) }.joined())!) + String(num).count)
            }
        }
    }
    print(result)
}

//solution1()

func solution(){
    let targetChannel = Int(readLine()!)!
    let M = Int(readLine()!)!
    var brokenButtons = [Int]()
    if M != 0 {
        brokenButtons = readLine()!.split(separator: " ").map{ Int(String($0))! }
    }
    
    var result = abs(100 - targetChannel)
    
    for num in 0..<1000000{
        let strNum = String(num).map{Int(String($0))!}
        var isUsable = true
        for brokenButton in brokenButtons {
            if strNum.contains(brokenButton){
                isUsable = false
                break
            }
        }
        
        if isUsable{
            result = min(result, abs(num-targetChannel) + String(num).count)
        }
    }
    print(result)
}
solution()

