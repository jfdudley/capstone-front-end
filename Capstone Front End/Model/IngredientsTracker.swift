//
//  IngredientsTracker.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/7/22.
//

import Foundation

class IngredientsTracker: ObservableObject {
    static func==(lhs:IngredientsTracker, rhs:IngredientsTracker) -> Bool {
        return lhs.ingredientsCount == rhs.ingredientsCount && lhs.ingredientNames == rhs.ingredientNames && lhs.ingredientAmounts == rhs.ingredientAmounts
    }
    
    @Published var ingredientsCount : Int = 3
    @Published var ingredientNames : [String] = ["", "", ""]
    @Published var ingredientAmounts: [String] = ["", "", ""]
    
    func addStep() {
        ingredientsCount += 1
        ingredientNames.append("")
        ingredientAmounts.append("")
    }
    
    func removeStep() {
        ingredientsCount -= 1
        ingredientNames.popLast()
        ingredientAmounts.popLast()
    }
    
    func convertToString()->String {
        var returnString = ""
        for num in 0..<self.ingredientsCount-1 {
            returnString += "\(self.ingredientAmounts[num])g \(self.ingredientNames[num])\n"
        }
        returnString += "\(self.ingredientAmounts[ingredientsCount-1])g \(self.ingredientNames[ingredientsCount-1])"
        return returnString
    }
    
    func convertToDict() -> [String : Double]{
        var returnDict : [String:Double] = [:]
        for num in 0..<self.ingredientsCount{
                let amountDouble = Double(ingredientAmounts[num])
                returnDict[ingredientNames[num]] = amountDouble
        }
        return returnDict
    }
    
    func resetTracker() {
        ingredientsCount = 3
        ingredientNames = ["", "", ""]
        ingredientAmounts = ["", "", ""]
        
    }
    
}
