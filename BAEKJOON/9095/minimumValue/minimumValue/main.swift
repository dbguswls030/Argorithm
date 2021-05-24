//
//  main.swift
//  minimumValue
//
//  Created by 유현진 on 2021/03/19.
//

import Foundation

var array: Array<Int> = [7,3,5,9,2,8,4,6]

func findMin(_ array: Array<Int>, _ index: Int)->Int{
    if index == array.count-1{
        return array[index]
    }
    var min = findMin(array, index+1)
    if array[index] < min{
        return array[index]
    }else{
        return min
    }
}


print(findMin(array, 0))
