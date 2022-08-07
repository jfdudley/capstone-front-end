//
//  Mold-ViewModel.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/4/22.
//

import Foundation

class MoldTracker: ObservableObject {
    @Published var totalVolume : Int = 0
    @Published var moldCounts : [Int : Int] = [:]
    
    func setMoldCounts(molds:[Mold]){
        molds.forEach { mold in
            self.moldCounts[mold.id] = 0
        }
    }
    
    func getIngredientTotal(percentage: Double) -> Double {
        let ingredientTotal = (Double(self.totalVolume) * (percentage / 100.0))
            return ingredientTotal
    }
    
    func increaseTotalVolume(increase: Int) {
        self.totalVolume += increase
    }
    
    func decreaseTotalVolume(decrease: Int) {
        self.totalVolume -= decrease
    }
}
