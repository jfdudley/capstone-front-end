//
//  MoldList.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct MoldList: View {
    @Binding var molds : [Mold]
    var body: some View {
        List(molds, id: \.self) {mold in
                MoldRow(mold: mold)
            }
            .navigationTitle("Mold List")
    }

    

struct MoldList_Previews: PreviewProvider {
    static var previews: some View {
        MoldList(molds: .constant(previewMolds))
    }
}
}

