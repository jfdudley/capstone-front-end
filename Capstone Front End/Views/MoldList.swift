//
//  MoldList.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct MoldList: View {
    @ObservedObject var moldTracker : MoldTracker
    @Binding var molds: [Mold]
    
    
    var body: some View {
        VStack {
            List($molds, id: \.self) {mold in
                MoldRow(mold: mold, moldTracker: moldTracker)
            }
            Button {
                moldTracker.totalVolume = 0
                moldTracker.setMoldCounts(molds: molds)
            } label: {
                Text("Reset Total Volume and Counts")
            }.padding(.bottom, 40)
        }
        
        }
    

    

struct MoldList_Previews: PreviewProvider {
    static var previews: some View {
        MoldList( moldTracker: MoldTracker(), molds: .constant(previewMolds))
    }
}
}
    


