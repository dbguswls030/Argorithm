//
//  main.swift
//  주차 요금 계산
//
//  Created by 유현진 on 2023/01/10.
//

import Foundation

//func solution(_ fees:[Int], _ records:[String]) -> [Int] {
//    func getTime(a: String, b: String) -> Int{
//        let left = a.components(separatedBy: ":")
//        let right = b.components(separatedBy: ":")
//        let leftHour =  Int(left[0])! * 60 + Int(left[1])!
//        let rightHour = Int(right[0])! * 60 + Int(right[1])!
//        return leftHour > rightHour ? leftHour-rightHour : rightHour - leftHour
//    }
//    let defaultTime = fees[0]
//    let defaultFee = fees[1]
//    let surchargeTime = fees[2]
//    let surcharge = fees[3]
//
//    var allList = [(String, String, String)]()
//    var chargeTimeList = [(String,Int)]()
//    var result = [(String,Int)]()
//    for record in records {
//        let map = record.components(separatedBy: " ")
//        let time = map[0]
//        let number = map[1]
//        let inOut = map[2]
//        if inOut == "IN"{
//            allList.append((time,number,inOut))
//        }else{
//            for (index,info) in allList.enumerated(){
//                if number == info.1{
//                    if let i = chargeTimeList.firstIndex(where: {$0.0 == number}){
//                        chargeTimeList[i] = (chargeTimeList[i].0, chargeTimeList[i].1 + getTime(a: allList[index].0, b:  time))
//                    }else{
//                        chargeTimeList.append((number, getTime(a: allList[index].0, b:  time)))
//                    }
//                    allList.remove(at: index)
//                    break
//                }
//            }
//        }
//    }
//    // 출차가 안 된 차량 시간 계산
//    if allList.count != 0 {
//        for data in allList{
//            if let index = chargeTimeList.firstIndex(where: {$0.0 == data.1}){
//                chargeTimeList[index] = (chargeTimeList[index].0, chargeTimeList[index].1 + getTime(a: data.0, b:  "23:59"))
//            }else{
//                chargeTimeList.append((data.0, getTime(a: data.0, b:  "23:59")))
//            }
//        }
//    }
//
////    print(chargeTimeList)
//
//    for data in chargeTimeList {
//        if data.1 > defaultTime{
//            let charge = Int(ceil(Double(data.1 - defaultTime) / Double(surchargeTime)))
//            result.append((data.0, defaultFee + charge * surcharge))
//        }else{
//            result.append((data.0, defaultFee))
//        }
//    }
//
//    return result.sorted{$0.0 < $1.0}.map{$0.1}
//
//}
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let defaultTime = fees[0]
    let defaultFee = fees[1]
    let surchargeTime = fees[2]
    let surchargeFee = fees[3]
    var recordList = [(Int,String)]()
    var result = [(Int,String)]()
    var returnList = [Int]()
    for record in records {
        let map = record.components(separatedBy: " ")
        let time = map[0]
        let number = map[1]
        let inOut = map[2]
        if inOut == "IN"{
            recordList.append((convertTimeToInt(time: time),number))
        }else{
            if let resultIndex = result.firstIndex(where: {$0.1 == number} ){
                if let index = recordList.firstIndex(where: {$0.1 == number}){
                    result[resultIndex] = (result[resultIndex].0 + convertTimeToInt(time: time) - recordList[index].0, result[resultIndex].1)
                    recordList.remove(at: index)
                }
            }else{
                if let index = recordList.firstIndex(where: {$0.1 == number}){
                    result.append((convertTimeToInt(time: time) - recordList[index].0, recordList[index].1))
                    recordList.remove(at: index)
                }
            }
        }
    }
   
    for list in recordList {
        if let index = result.firstIndex(where: {$0.1 == list.1}){
            let noOut = convertTimeToInt(time: "23:59") - list.0
            result[index] = (result[index].0 + noOut, result[index].1)
        }else{
            let noOut = convertTimeToInt(time: "23:59") - list.0
            result.append((noOut, list.1))
        }
    }
    
    let payments = result.sorted(by: {$0.1 < $1.1}).map{$0.0}
    for payment in payments {
        if payment > defaultTime{
            let charge = Int(ceil(Double(payment - defaultTime) / Double(surchargeTime)))
            returnList.append(defaultFee + charge * surchargeFee)
        }else{
            returnList.append(defaultFee)
        }
    }
    return returnList
}
func convertTimeToInt(time: String) -> Int{
    let timeStirng = time.components(separatedBy: ":")
    return Int(timeStirng[0])! * 60 + Int(timeStirng[1])!
}


print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
//print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
//print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))
//print(solution([180, 5000, 10, 600],["05:34 5961 IN", "06:34 5961 OUT", "07:34 5961 IN", "08:34 5961 OUT", "09:34 5961 IN", "10:34 5961 OUT", "11:34 5961 IN", "12:34 5961 OUT"]))
