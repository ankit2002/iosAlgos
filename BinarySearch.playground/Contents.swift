//: Playground - noun: a place where people can play

import UIKit

// Binary Search
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
numbers.index(of: 67)


func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            
            // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            
            // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}

func binarySearchNew<T: Comparable>(_ a:[T], key: T, range:Range<Int>) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        // the element is not in the array.
        return nil
    }
    else{
        // find the middle elements
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if a[midIndex] > key {
            //search element is smaller than the middle element
            return binarySearchNew(a, key: key, range: range.lowerBound ..< midIndex)
        }
        else if a[midIndex] < key{
            //search element is bigger than the middle element
            return binarySearchNew(a, key: key, range: midIndex + 1 ..< range.upperBound)
        }
        else{
            // we found the element
            return midIndex
        }
    }
}

// let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

numbers.count
binarySearch(numbers, key: 43, range: 0 ..< numbers.count)
binarySearchNew(numbers, key: 29, range: 0 ..< numbers.count)
