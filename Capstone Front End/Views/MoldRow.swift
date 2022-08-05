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
        }
    }
}

struct MoldRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoldRow(mold: previewMolds[0])
            MoldRow(mold: previewMolds[1])
        }.previewLayout(.fixed(width:300, height: 70))
    }
}

