//
//  main.swift
//  selectSort
//
//  Created by 유현진 on 2021/03/19.
//

import Foundation

var array: Array<Int> = [3,7,5,9,1,4,8,6,2]


func findMinIndex(_ array:Array<Int>, _ index: Int) -> Int{
    if index == array.count-1{
        return index
    }
    
    let minIndex = findMinIndex(array, index+1)
    if array[index] < array[minIndex]{
        return index
    }else{
        return minIndex
    }
}



func selectionSort(_ array: inout Array<Int>, _ index: Int) {
    if index == array.count-1 {
        return
    }
    
    let minIndex = findMinIndex(array, index+1)
    
    if array[minIndex] < array[index]{
        array.swapAt(index, minIndex)
    }
    print(array)
    selectionSort(&array, index+1)
    
    
}


selectionSort(&array, 0)
print(array)

