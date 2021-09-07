import Foundation

var input = readLine()!.components(separatedBy: " ").map() {Int($0)!}

let N = input[0] //정점의 개수
let M = input[1] //간선의 개수
let V = input[2] //탐색을 시작할 번호

var arr = Array(repeating: Array(repeating: 0, count: 0), count: N+1)
var stack = [Int]()
var v = [Int]() 

for _ in 0..<M{
    input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    arr[input[0]].append(input[1])
}
print(arr)


func dfs(_ s: Int){
    print(s)
    if v.count == N{
        return 
    }
    if !v.contains(s){
        v.append(s)
    }   
    if let a = arr[s].removeFirst() 
    dfs()
    
}

func bfs(_ s: Int){

}

dfs(V)
print(v)