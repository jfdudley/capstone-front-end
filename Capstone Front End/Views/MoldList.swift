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
            Text("Select molds:").font(.title2).foregroundColor(.white)
            List($molds, id: \.self) {mold in
                MoldRow(mold: mold, moldTracker: moldTracker)
            }
            Button {
                moldTracker.totalVolume = 0
                moldTracker.setMoldCounts(molds: molds)
            } label: {
                Text("Reset Total Volume and Counts")
            }.buttonStyle(.bordered).background(Color(.white)).cornerRadius(10).foregroundColor(Color("BdazzledBlue")).padding(2).frame(minWidth: 0, maxWidth: .infinity, alignment:.center).padding(.bottom, 50)
        }.padding().background(Color("ShadowBlue").ignoresSafeArea(.all)).foregroundColor(Color("BdazzledBlue"))
        
    }
    
    
    
    
    struct MoldList_Previews: PreviewProvider {
        static var previews: some View {
            MoldList( moldTracker: MoldTracker(), molds: .constant(previewMolds))
        }
    }
}



