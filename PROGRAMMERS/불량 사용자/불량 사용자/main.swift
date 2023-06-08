//
//  main.swift
//  불량 사용자
//
//  Created by 유현진 on 2023/06/07.
//

import Foundation

//func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
//    var result = Set<[Int]>()
//    func dfs(userId: [String], bannedId: [String], list: [Int], userVisited: [Bool], bannerVisited: [Bool]){
//        if list.count == bannedId.count{
//            result.update(with: list.sorted())
//            return
//        }
//        for (bannerOffset, banner)in bannedId.enumerated(){
//            if bannerVisited[bannerOffset] == true { continue }
//            for (userOffset, user) in userId.enumerated(){
//                var dfsFlag = false
//                if user.count == banner.count, userVisited[userOffset] == false{
//                    for i in 0..<user.count{
//                        if banner[banner.index(banner.startIndex, offsetBy: i)] == "*"{
//                            dfsFlag = true
//                            continue
//                        }
//                        if banner[banner.index(banner.startIndex, offsetBy: i)] != user[user.index(user.startIndex, offsetBy: i)] {
//                            dfsFlag = false
//                            break
//                        }else{
//                            dfsFlag = true
//                        }
//                    }
//                }
//
//                if dfsFlag == true{
//                    var dfsUserVisited = userVisited
//                    dfsUserVisited[userOffset] = true
//                    var dfsBannerVisited = bannerVisited
//                    dfsBannerVisited[bannerOffset] = true
//                    dfs(userId: userId, bannedId: bannedId, list: list + [userOffset], userVisited: dfsUserVisited, bannerVisited: dfsBannerVisited)
//                }
//            }
//        }
//    }
//    dfs(userId: user_id, bannedId: banned_id, list: [Int](), userVisited: Array(repeating: false, count: user_id.count), bannerVisited: Array(repeating: false, count: banned_id.count))
//    print(result)
//    return result.count
//}
func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var combine = [[String]]()
    var result = Set<[String]>()
    for banner in banned_id{
        var temp = [String]()
        let bArr = banner.map{String($0)}
        for user in user_id{
            if bArr.count != user.count{ continue }
            let uArr = user.map{String($0)}
            var addFlag = true
            for i in 0..<uArr.count{
                if bArr[i] == "*" {continue}
                if bArr[i] != uArr[i] {
                    addFlag = false
                    break
                }
            }
            if addFlag == true{
                temp.append(user)
            }
        }
        combine.append(temp)
    }
    
    
    func dfs(bList: [String], dept: Int){
        if bList.count == banned_id.count{
            result.insert(bList.sorted())
            return
        }
        for banner in combine[dept]{
            if !bList.contains(banner){
                dfs(bList: bList + [banner], dept: dept+1)
            }
        }
    }
    dfs(bList: [String](), dept: 0)
//    print(result)
    
    return result.count
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
