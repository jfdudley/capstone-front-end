//
//  InstructionsTracker.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import Foundation

class InstructionsTracker: ObservableObject {
    @Published var numInstructions : Int = 3
    @Published var instructionsArray : [String] = ["", "", ""]
    
    func addStep() {
        numInstructions += 1
        instructionsArray.append("")
    }
    
    func removeStep() {
        numInstructions -= 1
        instructionsArray.popLast()
    }
    
    func convertToString()->String {
        var returnString = ""
        for num in 0..<self.numInstructions-1 {
            returnString += "\(num + 1). \(self.instructionsArray[num])\n"
        }
        returnString += "\(self.numInstructions). \(self.instructionsArray[self.numInstructions - 1])"
        return returnString
    }
    
    func resetTracker() {
        numInstructions = 3
        instructionsArray = ["", "", ""]
    }

}
