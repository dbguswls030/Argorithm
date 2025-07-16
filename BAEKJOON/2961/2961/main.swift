import Foundation

func solution() {
    let N = Int(readLine()!)!
    var sour = [Int]()
    var bitter = [Int]()
    var result = Int.max

    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        sour.append(input[0])
        bitter.append(input[1])
    }

    for i in 1...(1<<N)-1 {
        var totalSour = 1
        var totalBitter = 0

        for j in 0..<N {
            if i & (1 << j) != 0 {
                totalSour *= sour[j]
                totalBitter += bitter[j]
            }
        }

        let diff = abs(totalSour - totalBitter)
        result = min(diff, result)
    }
    print(result)
}

solution()
