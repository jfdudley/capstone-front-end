//
//  Loading Page.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/1/22.
//

import SwiftUI

struct Loading_Page: View {

    
    var body: some View {
        Image("Loading Image").resizable().aspectRatio(contentMode: .fill).frame(minWidth:0, maxWidth: .infinity,alignment: .center).edgesIgnoringSafeArea(.all)
    }


struct Loading_Page_Previews: PreviewProvider {
    static var previews: some View {
        Loading_Page()
    }
}
}
