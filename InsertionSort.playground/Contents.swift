//: Playground - noun: a place where people can play

import UIKit

var str = "Insertion Sort, playground"

// Generic Insertion Sort for Every Type
func insertionSort<T>(_ array:[T], _ isOrderedBefore: (T,T) -> Bool) -> [T] {
    var a = array // copy of array
    for x in 1..<array.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y-1]) { // to a
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    
    return a
}

// Basic Insertion Sort for Integer Type
func insertionSort1(_ array:[Int]) -> [Int] {
    
    var a = array // copy of array
    for x in 1..<array.count {
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y-1] { // to a
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}


let list = [10,-1,3,9,2,27,8,5,1,3,0,26]
insertionSort(list, <)

let strings = ["b","a","d","c","e"]
insertionSort(strings, <)




