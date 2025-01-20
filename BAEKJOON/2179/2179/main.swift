//
//  main.swift
//  2179
//
//  Created by 유현진 on 1/19/25.
//

import Foundation
struct Word{
    let str: [String]
    let index: Int
}

func solution(){
    let N = Int(readLine()!)!
    var words = [Word]()
    var M = 0
    var strM = ""
    var S: Word?
    var T: Word?
    
    for i in 0..<N{
        let word = Word(str: readLine()!.map{String($0)}, index: i)
        words.append(word)
    }
    
    let oWords = words
    words.sort(by: { $0.str.joined() < $1.str.joined() })
    
    func updateM(a: Word, b: Word, equalStr: String){
        if M < equalStr.count{
            if a.index < b.index{
                S = a
                T = b
            }else{
                S = b
                T = a
            }
            strM = equalStr
        }else{
            let temp = [S!, T!, a, b].sorted(by: {$0.index < $1.index})
            strM = temp[0].str[0..<M].joined()
        }
        M = equalStr.count
    }
    
    func compare(a: Word, b: Word) {
        var equalCount = 0
        for i in 0..<min(a.str.count, b.str.count){
            if a.str[i] == b.str[i]{
                equalCount += 1
            }else{
                if equalCount > 0, M <= equalCount{ updateM(a: a, b: b, equalStr: a.str[0..<equalCount].joined())}
                return
            }
        }
        if equalCount > 0, M <= equalCount{ updateM(a: a, b: b, equalStr: a.str[0..<equalCount].joined())}
    }
    
    for i in 0..<N-1{
        compare(a: words[i], b: words[i+1])
    }
    var printCount = 0
    for oWord in oWords {
        if M > oWord.str.count{ continue }
        if oWord.str[0..<M].joined() == strM{
            print(oWord.str.joined())
            printCount += 1
        }
        if printCount == 2 { return }
    }
}

solution()

