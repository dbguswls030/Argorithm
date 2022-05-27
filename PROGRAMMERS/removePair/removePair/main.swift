//
//  main.swift
//  removePair
//
//  Created by 유현진 on 2022/05/27.
//

import Foundation
print(solution("baabaa"))
print(solution("cdcd"))
func solution(_ s:String) -> Int{
    let sArr = Array(s)
    var stack = [Character]()

    for i in sArr{
        if !stack.isEmpty && stack.last == i{
            stack.removeLast()
        }else{
            stack.append(i)
        }
    }
    return stack.isEmpty ? 1 : 0
}


//func solution(_ s:String) -> Int{
//    var sArr = s.map{$0}
//    var top = 0
//    while top < sArr.count - 1{
//          if sArr[top] == sArr[top+1]{
//              sArr.remove(at: top)
//              sArr.remove(at: top)
//              if top != 0{
//                  top -= 1
//              }
//          }else{
//              top += 1
//          }
//      }
//    return sArr.isEmpty ? 1 : 0
//}



//
//func solution(_ s:String) -> Int{
//    var top = 0
//    var s = s
//
//    while top < s.count - 1{
//        let cur = s.index(s.startIndex, offsetBy: top)
//        let next = s.index(s.startIndex, offsetBy: top+1)
//
//        if s[cur] == s[next]{
//            s.remove(at: cur)
//            s.remove(at: cur)
//            if top != 0 {
//                top -= 1
//            }
//        }else{
//            top += 1
//        }
//    }
//
//    return s.isEmpty ? 1 : 0
//}
