//
//  main.swift
//  1181
//
//  Created by 유현진 on 2021/01/25.
//
// https://www.acmicpc.net/problem/1181
import Foundation

var cnt = Int(readLine()!)!
var a : [String] = []

for _ in 0..<cnt{ a.append(readLine()!) }

a = Set(a).sorted(by:{$0<$1}).sorted(by:{$0.count<$1.count})

for i in 0..<a.count{ print(a[i]) }
