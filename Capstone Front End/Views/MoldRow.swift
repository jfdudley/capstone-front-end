//
//  MoldRow.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/2/22.
//

import SwiftUI

struct MoldRow: View {
    var mold: Mold
    
    var body: some View {
        HStack {
            Image(systemName:"seal")
            Text(mold.wellShape)
            Spacer()
            Text("\(mold.wellVolume)g each").padding(.trailing, 6.0)
        }
    }
}

struct MoldRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoldRow(mold: molds[0])
            MoldRow(mold: molds[1])
        }.previewLayout(.fixed(width:300, height: 70))
    }
}

