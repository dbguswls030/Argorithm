import Foundation

var arr = readLine()!.components(separatedBy: " ").map(){Int($0)!}
var N = arr[0]
var X = arr[1]
arr = readLine()!.components(separatedBy: " ").map(){Int($0)!}

for i in arr{
    if X > i{
        print(i, terminator: " ")
    }
}
