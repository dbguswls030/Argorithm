//맵 입력 받기
//주변 경로 탐색->다음 경로 스택에 넣기
//경로 지날 때마다 count + 1
//N,M 좌표일 때의 count를 저장
//count 제일 적은 경우를 출력
import Foundation


func searchPath(_ x: Int, _ y: Int, _ count: Int ){
    map[x][y] = 0
    if x+1 <= input[0]-1{
        if map[x+1][y] == 1{ //하
            stack.append([x+1, y, count+1])
        }
    }
    if y-1 >= 0{
        if map[x][y-1] == 1{ //좌
            stack.append([x, y-1, count+1])
        }
    }
    if x-1 >= 0{
        if map[x-1][y] == 1{ //상
            stack.append([x-1, y, count+1])
        }
    }
    
    if y+1 <= input[1]-1{
        if map[x][y+1] == 1{ //우
            stack.append([x, y+1, count+1])
        }
    }
    
}

func solution(_ x: Int, _ y: Int, _ count: Int) {
    
    searchPath(x, y, count)
    //print("x: \(y), y: \(x), count: \(count)")
    
    
    if x == input[0]-1, y == input[1]-1{
        if result > count {
            result = count
        }
    }
    //print(stack)
    if stack.count != 0{
        let cur = stack.removeFirst()
        solution(cur[0], cur[1], cur[2])
    }
    
}

var input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
var map = [[Int]]()
var stack = [[0, 0, 1]]
var result = 9999

for _ in 0..<input[0]{
    map.append(readLine()!.map({Int(String($0))!}))
}


let cur = stack.removeFirst() 
solution(cur[0], cur[1], cur[2])
print(result)
