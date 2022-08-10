//
//  InstructionsForm.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import SwiftUI

struct InstructionsForm: View {
    @ObservedObject var instructionsTracker : InstructionsTracker
    @Binding var instructions: String
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(1...instructionsTracker.numInstructions, id:\.self){num in
                    HStack {
                        Text("\(num).").foregroundColor(.white).fontWeight(.bold)
                        TextField("Instructions here", text: $instructionsTracker.instructionsArray[num-1]).padding(4.0).background(.white).cornerRadius(7)
                    }
                }.padding()
                
                HStack {
                    Spacer()
                    Button {
                        instructionsTracker.addStep()
                    } label: {
                        Text("Add step")
                    }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10)
                    Spacer()
                    Button {
                        instructionsTracker.removeStep()
                    } label: {
                        Text("Remove step")
                    }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10)
                    Spacer()
                }
                Button{
                    instructionsTracker.resetTracker()
                }label: {
                    Text("Reset instructions")
                }.buttonStyle(.bordered).foregroundColor(Color("BdazzledBlue")).background(.white).cornerRadius(10).padding()
            }
        }.background(Color("BdazzledBlue")).onDisappear{
            instructions = instructionsTracker.convertToString()
        }
    }
}

struct InstructionsForm_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsForm(instructionsTracker: InstructionsTracker(), instructions: .constant(""))
    }
}
