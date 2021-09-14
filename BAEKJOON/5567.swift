import Foundation

var N = Int(readLine()!)!
var M = Int(readLine()!)!

var graph = [Int: [Int]]()

for _ in 0..<M{
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let s = input[0]
    let e = input[1]
    if graph[s] == nil{
        graph[s] = [e]
    }else{
        graph[s]?.append(e)
    }
    if graph[e] == nil{
        graph[e] = [s]
    }else{
        graph[e]?.append(s)
    }
}
var visited = [Int]()
var queue = [1]
func bfs(_ s: Int, _ dept: Int){
    print("dept: \(dept)")
    print("start queue: \(queue)")
    
    if !visited.contains(s){
        visited.append(s)
        if let node = graph[queue.removeFirst()]{
            for i in node{
                if !visited.contains(i), !queue.contains(i){
                    queue.append(i)
                }
            }
        }
    }
    
    print("end queue: \(queue)")
    print("visited: \(visited)")
    if dept == 2{
        return
    }
    for i in queue{
        bfs(i,dept+1)
    }
}

bfs(1, 0)
print(visited.count-1)


