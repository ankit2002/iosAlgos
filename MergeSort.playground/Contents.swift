//: Playground - noun: a place where people can play

import UIKit

var str = "Merge Sort, Top-down Approach playground"

func mergeSort(_ array:[Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    
    return merge(leftPile: leftArray , rightPile: rightArray)
}


func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
    // indexes to keep track of progress
    var leftIndex = 0
    var rightIndex = 0
    
    // empty array
    var orderedPile = [Int]()
    
    // comparing elements are merging them
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    // leftPile or Rightpile has completely merged into the orderedPile from previous loop... SO no more comparision
    // just append the rest of the elements in the array
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}


let array = [82,28,1,2]
mergeSort(array)
