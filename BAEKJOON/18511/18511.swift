import Foundation

func solution(_ n : Int){
    if n > N {
        return
    }
    if n > max{
        max = n
    }
    for i in 0..<count{
        solution(n*10+K[i])
    }
}

var readInput = readLine()!.components(separatedBy: " ").map(){Int($0)!}
let N = readInput[0]
let count = readInput[1]
var max = 0
var K = readLine()!.components(separatedBy: " ").map(){Int($0)!}
K=K.sorted(by: >)
solution(0)
print(max)
