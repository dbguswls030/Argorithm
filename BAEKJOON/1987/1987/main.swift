import Foundation

//func solution() {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let r = input[0]
//    let c = input[1]
//    let dx = [0,0,-1,+1]
//    let dy = [1,-1,0,0]
//    var board = [[Int]]()
//
//    for _ in 0..<r {
//        board.append(readLine()!.map { Int($0.asciiValue!) - 65 })
//    }
//
//    var result = 0
//    var visited = Array(repeating: false, count: 26)
//    visited[board[0][0]] = true
//
//    func dfs(cur: (Int, Int), dept: Int) {
//        result = max(result, dept)
//
//        for i in 0..<4 {
//            let nx = cur.0 + dx[i]
//            let ny = cur.1 + dy[i]
//            if nx >= 0, nx < r, ny >= 0, ny < c, !visited[board[nx][ny]] {
//                visited[board[nx][ny]] = true
//                dfs(cur: (nx, ny), dept: dept+1)
//                visited[board[nx][ny]] = false
//            }
//        }
//    }
//    dfs(cur: (0, 0), dept: 1)
//    print(result)
//}

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let r = input[0]
    let c = input[1]
    let dx = [0,0,-1,+1]
    let dy = [1,-1,0,0]
    var board = [[Int]]()

    for _ in 0..<r {
        board.append(readLine()!.map { Int($0.asciiValue!) - 65 })
    }

    var result = 0

    func dfs(cur: (Int, Int), dept: Int, visited: Int) {
        if result < dept {
            result = dept
        }

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if nx >= 0, nx < r, ny >= 0, ny < c {
                let next = 1 << board[nx][ny]
                if visited & next == 0 {
                    dfs(cur: (nx, ny), dept: dept+1, visited: visited | next)
                }
            }
        }
    }
    dfs(cur: (0, 0), dept: 1, visited: 1 << board[0][0])
    print(result)
}

solution()
