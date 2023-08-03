//
//  main.swift
//  파일명 정렬
//
//  Created by 유현진 on 2023/08/01.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    var f = [[String]]()
    for file in files {
        var intPart = false
        var start = -1
        var end = -1
        for (offset, c) in file.enumerated(){
            if c.isNumber, intPart == false{
                intPart = true
                start = offset
                end = offset
            }else if !c.isNumber, intPart == true{
                if offset - 1 == start{
                    end = start + 1
                }else{
                    end = offset
                }
                break
            }
        }
        
        let first = file[file.startIndex..<file.index(file.startIndex, offsetBy: start)]
        let second = file[file.index(file.startIndex, offsetBy: start)..<file.index(file.startIndex, offsetBy: end)]
        let third = file[file.index(file.startIndex, offsetBy: end)..<file.index(file.startIndex, offsetBy: file.count)]
        
//        print([String(first),String(second),String(third)])
        f.append([String(first),String(second),String(third)])
    }
    
    f = f.map{$0.filter{ $0 != ""}}
    
    f.sort { a, b in
        if a[0].uppercased() != b[0].uppercased(){
            return a[0].uppercased() < b[0].uppercased()
        }else{
            return Int(a[1])! < Int(b[1])!
        }
    }
    
    return f.map{$0.joined()}
}

print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
print(solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]))
print(solution(["F-5", "B-50", "A-10", "F-14"]))
