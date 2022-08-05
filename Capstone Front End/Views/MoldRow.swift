//
//  MoldRow.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct MoldRow: View {
    @Binding var mold: Mold
    @ObservedObject var moldTracker: MoldTracker
    
    var body: some View {
        HStack {
            Image(systemName:"seal")
            Text(mold.wellShape)
            Spacer()
            Text("\(moldTracker.moldCounts[mold.id] ?? 0)")
            Button {
                moldTracker.decreaseTotalVolume(decrease: mold.wellVolume)
                moldTracker.moldCounts[mold.id]! -= 1
                print("decreaseCount total volume: \(moldTracker.totalVolume)")
                print("decrease count moldCount: \(moldTracker.moldCounts[mold.id]!)")
            } label: {
                Image(systemName: "minus")
            }.buttonStyle(PlainButtonStyle())
            Button {
                moldTracker.increaseTotalVolume(increase: mold.wellVolume)
                moldTracker.moldCounts[mold.id]! += 1
                print("increaseCount total volume: \(moldTracker.totalVolume)")
                print("increaseCount moldCount: \(moldTracker.moldCounts[mold.id]!)")
            } label: {
                Image(systemName: "plus")
            }.buttonStyle(PlainButtonStyle())

        }
    }
}

struct MoldRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoldRow(mold: .constant(previewMolds[0]), moldTracker: MoldTracker())
            MoldRow(mold: .constant(previewMolds[1]), moldTracker: MoldTracker())
        }.previewLayout(.fixed(width:300, height: 70))
    }
}

