//
//  main.swift
//  이모티콘 할인 행사
//
//  Created by 유현진 on 2023/07/10.
//

import Foundation
func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var pay = 0
    var plusUser = 0
    var emoticons = emoticons.map{[$0,0]}
    let discount = [40, 30, 20, 10]
    func calc(){
        var sumPay = 0
        var addPlusUser = 0
        
        for user in users {
            var userPay = 0
            for emoticon in emoticons {
                if emoticon[1] == 40{
                    
                }else if emoticon[1] == 30{
                    if user[0] > 30{
                        continue
                    }
                }else if emoticon[1] == 20{
                    if user[0] > 20{
                        continue
                    }
                }else if emoticon[1] == 10{
                    if user[0] > 10{
                        continue
                    }
                }
                userPay += Int((Double(100 - emoticon[1]) * 0.01) * Double(emoticon[0]))
            }
            if user[1] <= userPay{
                addPlusUser += 1
            }else{
                sumPay += userPay
            }
        }
        if plusUser < addPlusUser{
            plusUser = addPlusUser
            pay = sumPay
        }else if plusUser == addPlusUser{
            if pay < sumPay{
                pay = sumPay
            }
        }
        
    }
    
    func dfs(dept: Int){
        if dept == emoticons.count{
            calc()
            return
        }
        for d in discount{
            emoticons[dept][1] = d
            dfs(dept: dept + 1)
        }
    }
    dfs(dept: 0)
    return [plusUser, pay]
}

print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
