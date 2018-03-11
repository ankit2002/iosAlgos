//: Playground - noun: a place where people can play

import UIKit

var str = "Closures, playground"

// Function with Closures
func testGreet(name: String, ability: String) -> (farewell: String, mtfwu: String) {
    return ("Good Bye \(name). ", "May the \(ability) be with you")
}


// Calling of Function
let retValue = testGreet(name: "Old Friend", ability: "Force")
//print(retValue)
//print(retValue.farewell)
//print(retValue.mtfwu)

// Passing and returing function
func jediTrainer () -> ((String, Int) -> String) {
    
    func train(name: String, times: Int) -> (String) {
        return "\(name) has been trained in the Force \(times) times"
    }
    return train
}
let train1 = jediTrainer()
train1("Obi Wan", 3)


// Variadic Functions
func jediBladeColor (_ colors:String...) -> () {
//    for c in colors {
//     print(c)
//    }
}

jediBladeColor("red","green")


// Defining Closures
let testmaps = ["a","map", "belongs", "to", "some"]
let t = testmaps.map({
    (s: String) -> String in
    "\(s) has been tested"
})

//Defining Closures with known type
func applymultiplication(_ value: Int, _ multfunction: (Int) -> Int) -> Int {
    return multfunction(value)
}

// First way to implement closure
applymultiplication(4, { value in
    value * 3
})

// Second way to implement
applymultiplication(2, { $0 * 3 })

// third way to implement -- but only when closure is the last element of the function argument
applymultiplication(2) {$0 * 3}

// Taking notes of MAP, Filter and Reduce on Swift
// MAP ======= in Dictionary and Array
let arr = [2,3,4,15]
let arr1 = arr.map { $0 * $0 }

// peforming in Dictionary
let milesToPoint = ["point1":120.0, "point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map {name,miles in miles * 1.6093}

//Mapping array of Int to array of String
let intToString = arr.map { NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut) }

// Filtering ======= the array using Filter
// using previous Array - arr
let evenNumbers = arr.filter { $0 % 2 == 0 }


// Reduce ======== in Array and Dictionary
// using previous Array - arr
let countOfArray = arr.reduce(6, +)
let arrOfDict = ["Ank","it","Mis","hra"]
let testDict = arrOfDict.reduce(" ",+)
let testDict1 = arrOfDict.reduce("===") { name,t in "\(name),\(t)" }


// FlatMap ======= in Array and Dictionary
let collections = [[5,2,7],[4,8],[91,1,3]]
let flat = collections.flatMap { $0 }

let people = ["Ank", nil,"it","Mis","hra", nil]
let flatStr = people.flatMap { $0 }
let onlyEven = collections.flatMap { $0.filter { $0 % 2 == 0 } }
let allSquared = collections.flatMap{ $0.map { $0 * $0 } }
let sum = collections.flatMap{ $0.reduce(0,+) }
// using simple map
let sum1 = collections.map{ $0.reduce(0,+) }

// For example to sum only those numbers greater than or equal to seven
let marks = [4,5,8,2,9,7]
let totalPass = marks.filter{ $0 >= 7 }.reduce (0,+)

 // Another example that returns only the even squares by first filtering the odd values and then mapping the remaining values to their squares

let numbers = [20,17,35,4,12]
let evenSquares = numbers.filter{ $0 % 2 == 0 }.map{ $0 * $0 }
evenSquares














