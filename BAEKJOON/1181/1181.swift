let n = Int(readLine()!)!
var arr : [String] = []
for _ in 0..<n{
    let x = readLine()!
    arr.append(x)
}

let result = Set(arr)
arr = Array(result)
arr = arr.sorted{ $0 < $1}

arr = arr.sorted{ $0.count < $1.count}

for i in arr{
    print(i)
}
