//
//  main.swift
//  arraySum
//
//  Created by 유현진 on 2021/03/19.
//

import Foundation

var array: Array<Int> = [7,3,5,9,2,6,8,4,1]

 
func arraySum(_ array: Array<Int>, _ index: Int)->Int{
    if index == array.count-1{
        return array[index]
    }
    
    return arraySum(array, index+1)+array[index]
}

print(arraySum(array, 0))
