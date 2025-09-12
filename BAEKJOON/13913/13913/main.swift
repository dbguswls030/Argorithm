import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    let N = input[0] // 수빈이 위치
    let K = input[1] // 동생의 위치

    if N == K {
        print(0)
        print(N)
        return
    }

    var visited = Array(repeating: -1, count: 100001)

    var queue = [N]
    var dept = 0

    while !queue.isEmpty {
        dept += 1
        var temp = [Int]()

        for cur in queue {
            if cur == K {
                print(dept-1)
                var pre = K
                var path = [pre]

                while pre != N, pre != -1 {
                    pre = visited[pre]
                    path.append(pre)
                }

                print(path.map{ String($0) }.reversed().joined(separator: " "))
                return
            }
            let next = [cur - 1, cur + 1, cur * 2]

            for n in next {
                if (0...100000).contains(n), visited[n] == -1 {
                    temp.append(n)
                    visited[n] = cur
                }
            }
        }
        queue = temp
    }
}

solution()
