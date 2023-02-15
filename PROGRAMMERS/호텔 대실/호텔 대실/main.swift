//
//  main.swift
//  호텔 대실
//
//  Created by 유현진 on 2023/02/14.
//

import Foundation

//func solution(_ book_time:[[String]]) -> Int {
//    func convertMinute(time: String) -> Int{
//        let t = time.split(separator: ":")
//        let h = Int(t[0])! * 60
//        let m = Int(t[1])!
//        return h+m
//    }
//    var rooms = [[(Int, Int)]]()
//    var count = 0
//    for time in book_time{
////        print(time)
//        let left = convertMinute(time: time[0])
//        let right = convertMinute(time: time[1]) + 10
//        var addFlag = false
//        if rooms.isEmpty {
//            count += 1
//            rooms.append([(left, right)])
////            print("+1")
//            continue
//        }
//        for (index, _) in rooms.enumerated(){
//            if !rooms[index].contains(where: {
//                left < $0.0 && right > $0.0 ||
//                left >= $0.0 && right <= $0.1 ||
//                left < $0.1 && right > $0.1 ||
//                left <= $0.0 && right >= $0.1
//            }){
//                rooms[index].append((left,right))
//                addFlag = true
//                break
//            }
//            if addFlag { break }
//        }
//        if !addFlag{
//            rooms.append([(left, right)])
////            print("+1")
//            count += 1
//        }
////        rooms.forEach{ room in
////            room.forEach{
////                print("\($0.0 / 60):\($0.0 % 60), \($0.1 / 60):\($0.1 % 60)",terminator: " ")
////            }
////            print()
////        }
//    }
//    return count
//}
func solution(_ book_time:[[String]]) -> Int {
    func convertMinute(time: String) -> Int{
        let t = time.split(separator: ":")
        let h = Int(t[0])! * 60
        let m = Int(t[1])!
        return h+m
    }
    var room = Array(repeating: 0, count: 24*60+60 + 10 + 1)
    for time in book_time{
        let left = convertMinute(time: time[0])
        let right = convertMinute(time: time[1]) + 10
        for i in left..<right{
            room[i] += 1
        }
    }
    return room.max()!
}
print(solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]]))
print(solution([["09:10", "10:10"], ["10:20", "12:20"]]))
print(solution([["10:20", "12:30"], ["10:20", "12:30"], ["10:20", "12:30"]]))
