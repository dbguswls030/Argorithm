import Foundation

func solution() {
    let a = Array(readLine()!)
    let b = Array(readLine()!)
    let c = Array(readLine()!)

    var LCS = Array(
        repeating: Array(
            repeating: Array(
                repeating: 0,
                count: c.count+1
            ),
            count: b.count+1
        ),
        count: a.count+1
    )

    for i in 1...a.count {
        for j in 1...b.count {
            for z in 1...c.count {
                if a[i-1] == b[j-1] && b[j-1] == c[z-1] {
                    LCS[i][j][z] = LCS[i-1][j-1][z-1] + 1
                } else {
                    LCS[i][j][z] = max(LCS[i-1][j][z], LCS[i][j-1][z], LCS[i][j][z-1])
                }
            }
        }
    }
    print(LCS[a.count][b.count][c.count])
}

solution()
