//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 2-Sum algorithm
// Given Array and Target
let arr = [3,2,9,8]

func twoSum(_ nums:[Int], target:Int) -> (Int,Int)? {
    var dict = [Int:Int]()
    
    for (currentIndex, n) in nums.enumerated(){
        let complement = target - n
        
        if let complementIndex = dict[complement] {
            return (complementIndex, currentIndex)
        }
        
        dict[n] = currentIndex
    }
    return nil
}

twoSum(arr, target: 10)

// 2 sum algo - 2nd options
// Array must be sorted for this option
let arr1 = [2, 3, 4, 4, 7, 8, 9, 10, 12, 14, 21, 22, 100]
func twoSumProblem(_ a:[Int], target:Int) -> (Int,Int)? {
    
    var startIndex = a.startIndex
    var endIndex = a.endIndex - 1
    
    while startIndex < endIndex {
        
        let sum = a[startIndex] + a[endIndex]
        // element found -- return it
        if sum == target {
            return (a[startIndex], a[endIndex])
        }
        else if sum > target{
            endIndex = endIndex - 1
        }
        else {
            startIndex = startIndex + 1
        }
    }
    return nil
}

twoSumProblem(arr1, target: 10)
