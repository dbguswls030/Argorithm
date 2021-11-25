//
//  main.swift
//  1780
//
//  Created by 유현진 on 2021/11/25.
//


import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }


    @inline(__always) func readString() -> String {
            var str = ""
            var now = read()

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                    && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
            }

            return str
        }
  }
func solution(){
    var file = FileIO()
    let N = file.readInt()

    var arr = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0..<N{
        for j in 0..<N{
            arr[i][j] = file.readInt()
        }
    }
    var resultArr = [0, 0, 0]
    
    dc((0, arr.count), (0, arr.count))
    print(resultArr[0])
    print(resultArr[1])
    print(resultArr[2])
    func dc(_ width: (Int, Int), _ height: (Int, Int)){

        var dif = false
        let first = arr[width.0][height.0]
        for i in width.0..<width.1{
            for j in height.0..<height.1{
                if first != arr[i][j]{
                    dif = true
                    break
                }
            }
        }
        if dif == true{
            // (0, 9) (0, 9)
            let dx = (width.1 - width.0) / 3
            let dy = (height.1 - height.0) / 3
            dc((width.0, width.0+dx),(height.0, height.0+dy))
            dc((width.0, width.0+dx),(height.0+dy*1, height.0+dy*2))
            dc((width.0, width.0+dx),(height.0+dy*2, height.0+dy*3))
            dc((width.0+dx*1, width.0+dx*2),(height.0, height.0+dy))
            dc((width.0+dx*1, width.0+dx*2),(height.0+dy*1, height.0+dy*2))
            dc((width.0+dx*1, width.0+dx*2),(height.0+dy*2, height.0+dy*3))
            dc((width.0+dx*2, width.0+dx*3),(height.0, height.0+dy))
            dc((width.0+dx*2, width.0+dx*3),(height.0+dy*1, height.0+dy*2))
            dc((width.0+dx*2, width.0+dx*3),(height.0+dy*2, height.0+dy*3))
        }else{
            if first == -1{
                resultArr[0] += 1
            }else if first == 0{
                resultArr[1] += 1
            }else{
                resultArr[2] += 1
            }
        }
        
    }
}
solution()
