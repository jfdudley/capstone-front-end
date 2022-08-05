//
//  MoldFormStepper.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/3/22.
//

import SwiftUI

struct MoldFormStepper: View {
    @Binding var mold : Mold
    @ObservedObject var moldTracker: MoldTracker
    
    
    var body: some View {
//        CustomStepper(value: moldTracker.moldCounts[mold.id], in: 0...mold.numWells,
//            onIncrement: {
//            moldTracker.increaseTotalVolume(increase: mold.wellVolume)
//            print(moldTracker.totalVolume)
//        }, onDecrement: {
//            moldTracker.decreaseTotalVolume(decrease: mold.wellVolume)
//        }){
            HStack {
                MoldRow(mold: mold)
//                Text("\(moldTracker.moldCounts[mold.id])")
            }
        }
//}

struct MoldFormStepper_Previews: PreviewProvider {
    static var previews: some View {
        MoldFormStepper(mold: .constant(previewMolds[0]), moldTracker: MoldTracker())
    }
}
}
