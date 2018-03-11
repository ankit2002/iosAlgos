//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


extension BinarySearchTree : CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description)) "
        }
        return s
    }
}


public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    
    public init(value: T){
        self.value = value
    }
    
    // Init Method for convenience
    public convenience init (array : [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    // Adding new nodes to Tree
    public func insert(value:T) {
        
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree (value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree (value: value)
                right?.parent = self
            }
        }
    }
    
    // Searching Item in Tree
    public func search(value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        
        while let n = node {
            if value < n.value {
                node = n.left
            }
            else if value > n.value {
                node = n.right
            }
            else{
                return node
            }
        }
        return nil
    }
    
    // Traversing the tree - In order
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    // Traversing the tree - Pre order
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    // Traversing the tree - Post order
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    // Mapaing of the array element
    public func map(formula: (T) -> T) -> [T] {
        
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }
    
    
    // helper function
    private func reconnectParentToNode(node: BinarySearchTree?){
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    //Minimum value in tree
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    // Maximum value in tree
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        
        // replacement of the node
        let replacement: BinarySearchTree?
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        //place the replacement on current nodes
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentToNode(node: replacement)
        
        //remove current node
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    // Height of the tree
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    
}

// Code Testing
let tree = BinarySearchTree<Int> (array: [7,2,5,10,9,1])
//let tree = BinarySearchTree<Int> (array: [7,2])
tree.search(value: 5)
tree.search(value: 3)

if let node9 = tree.search(value: 9) {
    node9.depth()
}

tree.traversePostOrder { val in print(val) }
tree.toArray()
tree.height()




