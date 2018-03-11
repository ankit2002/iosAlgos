//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public struct Stack<T>{
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

var stackOfNames = Stack(array:["A","B"])
stackOfNames.push("D")
stackOfNames.pop()
stackOfNames.count
