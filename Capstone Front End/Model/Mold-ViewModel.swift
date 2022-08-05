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
            self.moldCounts[mold.id] = mold.numWells
        }
    }
    
    func getIngredientTotal(percentage: Int) -> Int {
        return Int(Double(self.totalVolume) * (Double(percentage) / 100.0))
    }
    
    func increaseTotalVolume(increase: Int) {
        self.totalVolume += increase
    }
    
    func decreaseTotalVolume(decrease: Int) {
        self.totalVolume -= decrease
    }
}
