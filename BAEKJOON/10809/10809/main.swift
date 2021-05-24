//
//  main.swift
//  10809
//
//  Created by 유현진 on 2020/12/21.
//

import Foundation

var str = String(readLine()!)



for i in Character("a").asciiValue!...Character("z").asciiValue!{
    
    if let rangeI = str.range(of: String(UnicodeScalar(i))){
        let s = str.distance(from: str.startIndex, to: rangeI.lowerBound)
        print("\(s) ", terminator: "")
    }else{
        print("-1 ", terminator: "")
    }
}


