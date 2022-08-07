//
//  IngredientsTracker.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/7/22.
//

import Foundation

class IngredientsTracker: ObservableObject {
    @Published var ingredientsCount : Int = 3
    @Published var ingredientNames : [String] = ["", "", ""]
    @Published var ingredientAmounts: [Double] = [0.0, 0.0, 0.0]
    
    func addStep() {
        ingredientsCount += 1
        ingredientNames.append("")
        ingredientAmounts.append(0.0)
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
                returnDict[ingredientNames[num]] = ingredientAmounts[num]
        }
        return returnDict
    }
    
    func resetTracker() {
        ingredientsCount = 3
        ingredientNames = ["", "", ""]
        ingredientAmounts = [0.0, 0.0, 0.0]
        
    }
    
}
