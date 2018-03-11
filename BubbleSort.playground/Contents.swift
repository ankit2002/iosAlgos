//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func bubbleSort(_ arr:[Int]) -> [Int]? {
    
//    var startIndex = array.startIndex
//    var nextIndex = startIndex+1
    
    var array :[Int] = arr
    
    
    for i in stride(from: 0, to:array.count , by: 1) {
        for startIndex in stride(from: 0, to: (array.count - i), by: 1) {
            
            let nextIndex = startIndex+1
            // check index
            if nextIndex < array.count {
                
                // perform swapping
                if array[startIndex] > array[nextIndex] {
                    let temp = array[startIndex]
                    array[startIndex] = array[nextIndex]
                    array[nextIndex] = temp
                }
            }
        }
    }
    
    // returning sorted arrya
    return array
}


let sortedArray = bubbleSort([18,1,14,2,8])

