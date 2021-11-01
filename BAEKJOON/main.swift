//
//  main.swift
//  2805
//
//  Created by 유현진 on 2021/11/01.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let _ = input[0]
    let M = input[1]
    let t = readLine()!.components(separatedBy: " ").map() {Int($0)!}

    let top = Int(t.max()!)
    
    binarySearch(0, top, top)
    
    func binarySearch(_ low: Int, _ top: Int, _ height: Int){
        print(low, top, height)
        var result = 0
        for i in t{
            if i > height{
                result += i - height
            }
        }
        if result == M{
            print(height)
            return
        }
        else if result > M{
            binarySearch(height ,top, height + (top-height)/2+1)
        }else{
            binarySearch(low ,height, height-(height-low)/2)
        }
        
    }
}

solution()
