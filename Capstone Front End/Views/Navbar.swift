//
//  Navbar.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/11/22.
//

import SwiftUI

struct Navbar: ToolbarContent {
    
    @Binding var rootIsActive : Bool
    @State var textColor : Color
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement:.bottomBar){
            Spacer()
            Button (action: { self.rootIsActive = false } ){
                Image(systemName: "house").foregroundColor(textColor)
            }
            Spacer()
            Button (action: {print("Account button pressed")}){
                Image(systemName: "person.crop.circle").foregroundColor(textColor)
            }
            Spacer()
        }
    }
}

//struct Navbar_Previews: PreviewProvider {
//    static var previews: some View {
//        Navbar()
//    }
//}
