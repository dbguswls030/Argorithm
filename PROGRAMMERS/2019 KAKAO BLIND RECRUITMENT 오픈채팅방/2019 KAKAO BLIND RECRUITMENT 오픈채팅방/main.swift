//
//  main.swift
//  2019 KAKAO BLIND RECRUITMENT 오픈채팅방
//
//  Created by 유현진 on 2022/05/17.
//

// 명령어와 Id result에 저장 & id와 닉네임을 딕셔너리로 저장
// result 에서 id에 해당되는 닉네임과 명령어를 출력

import Foundation

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))

func solution(_ record:[String]) -> [String] {
    var sequence = [[String]]()
    var users = [String:String]()
    var result = [String]()
    for i in record{
        let str = i.split(separator: " ")
        var command = ""
        var userId = ""
        var name = ""
        
        if str.count == 2{
            command = String(str[0])
            userId = String(str[1])
            sequence.append([command,userId])
        }else if str.count == 3{
            command = String(str[0])
            userId = String(str[1])
            name = String(str[2])
            users[userId] = name
            sequence.append([command,userId])
        }
    }
    for i in sequence{
        let nickName = users[i[1]] ?? ""
        
        
        if i[0] == "Enter"{
            result.append("\(nickName)님이 들어왔습니다.")
        }else if i[0] == "Leave"{
            result.append("\(nickName)님이 나갔습니다.")
        }
    }
    return result
}

