
//: Playground - noun: a place where people can play

import UIKit

var str = "HeapSort, playground"


extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: (elements.count - 1), through: 1, by: -1){
            swap(&elements[0], &elements[i])
            shiftDown(0, heapSize: i)
        }
    }
    return elements
}

public func heapsort<T>(_ a: [T], _ sort: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { i1, i2 in sort(i2, i1) }
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}


var h1 = Heap(array: [5, 13, 2, 25, 7, 17, 20, 8, 4], sort: >)
let a1 = h1.sort()
