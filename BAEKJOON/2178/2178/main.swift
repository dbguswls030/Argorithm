//
//  main.swift
//  2178
//
//  Created by 유현진 on 2021/09/26.
//

import Foundation

print("Hello, World!")
var input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
var map = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])

