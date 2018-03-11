//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// (5 * (a-10))+(-4 * (3/b))
public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _ , right) :
            return left.count + 1 + right.count
        case .empty :
            return 0
        }
    }
    
    // Traversing Method for the tree - Inorder
    public func traverseInOrder(process: (T) -> Void) {
        
        if case let .node(left,value,right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    // Traversing Method for the tree - Preorder
    public func traversePreOrder(process: (T) -> Void) {
        
        if case let .node(left,value,right) = self {
            process(value)
            left.traversePreOrder(process: process)
            left.traversePreOrder(process: process)
        }
    }
    
    // Traversing Method for the tree - PostOrder
    public func traversePostOrder(process: (T) -> Void) {
        
        if case let .node(left,value,right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}


// creating all the leaf node
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeb = BinaryTree.node(.empty, "b", .empty)

// creating intermediate Node Left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// creating intermediate Node Right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeb)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)
print(tree)
tree.count


extension BinaryTree: CustomStringConvertible{
    public var description: String {
        switch self {
        case let .node(left,value,right):
            return "value: \(value), left: [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}
