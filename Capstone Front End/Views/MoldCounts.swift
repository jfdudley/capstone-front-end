//
//  MoldCounts.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/10/22.
//

import SwiftUI

struct MoldCounts: View {
    
    @Binding var molds : [Mold]
    @ObservedObject var moldTracker : MoldTracker
    
//    @State var moldCountString : String = ""
    
    var body: some View {
        HStack {
            ForEach(Array(moldTracker.moldCounts.keys), id: \.self){moldId in
                if moldTracker.moldCounts[moldId]! > 0 {
                    let selectedMold = molds.filter{$0.id == moldId}
                    Text("\(moldTracker.moldCounts[moldId]!) \(selectedMold[0].wellShape) mold(s)").font(.caption).frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                }
                
            }
        }
//        Text("\(moldCountString)")
    }
}

struct MoldCounts_Previews: PreviewProvider {
    static var previews: some View {
        MoldCounts(molds: .constant(previewMolds), moldTracker: MoldTracker())
    }
}
