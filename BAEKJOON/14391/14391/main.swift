import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0]
    let M = input[1]
    var arr = [[String]]()
    var result = 0

    for _ in 0..<N {
        arr.append(readLine()!.map { String($0) })
    }

    for i in 0..<(1 << (N*M)) {
        var colSum = 0
        var rowSum = 0

        // 가로 조각
        for x in 0..<N {
            var sum = ""
            for y in 0..<M {
                if i & (1 << (x * M + y)) == 0 {
                    sum += arr[x][y]
                } else {
                    colSum += Int(sum) ?? 0
                    sum = ""
                }
            }
            colSum += Int(sum) ?? 0

        }
        // 세로 조각
        for y in 0..<M {
            var sum = ""
            for x in 0..<N {
                if i & (1 << (x * M + y)) != 0 {
                    sum += arr[x][y]
                } else {
                    rowSum += Int(sum) ?? 0
                    sum = ""
                }
            }
            rowSum += Int(sum) ?? 0
        }

        result = max(result, colSum + rowSum)
    }
    print(result)
}

solution()
