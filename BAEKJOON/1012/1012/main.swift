//
//  main.swift
//  1012
//
//  Created by 유현진 on 2021/06/29.
//
// fucking hanna
import Foundation

struct Location {
    var x : Int
    var y : Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func searchPath(_ location: Location){
    //left
    if location.x-1 >= 0 {
        if map[location.y][location.x-1] == 1{
            stack.append(Location(location.x-1, location.y))
        }
    }
    //down
    if location.y-1 >= 0 {
        if map[location.y-1][location.x] == 1{
            stack.append(Location(location.x, location.y-1))
        }
    }
    //right
    if location.x+1 <= map[0].count-1 {
        if map[location.y][location.x+1] == 1{
            stack.append(Location(location.x+1, location.y))
        }
    }
    //up
    if location.y+1 <= map.count-1 {
        if map[location.y+1][location.x] == 1{
            stack.append(Location(location.x, location.y+1))
        }
    }
}

func dfs(){
    while stack.count != 0{
        //print(stack)
        let x = stack[stack.count-1].x
        let y = stack[stack.count-1].y
        map[y][x] = 11
        searchPath(stack.removeLast())
    }
    count+=1
}

var t = Int(readLine()!)! // Test case
var m: Int
var n: Int
var cabbage: Int
var count : Int
var stack: [Location]
var map : [[Int]]
var result : [Int] = []

for _ in 0..<t{
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)}
    m = input[0]!
    n = input[1]!
    cabbage = input[2]!
    count = 0
    stack = []
    map = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    //print(map)
    
    //init map
    for _ in 0..<cabbage{
        let xy = readLine()!.components(separatedBy: " ").map() {Int($0)}
        let x = xy[0]!
        let y = xy[1]!
        map[y][x] = 1
    }
    
    //print(map)
    
    for i in 0..<n{
        for j in 0..<m{
            if map[i][j] == 1{
                stack.append(Location(j,i))
                dfs()
            }
        }
    }
    result.append(count)
}
for result in result{
    print(result)
}








