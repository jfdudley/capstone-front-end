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
                        Text("\(num).")
                        TextField("Instructions here", text: $instructionsTracker.instructionsArray[num-1])
                    }
                }.padding()
                
                HStack {
                    Button {
                        instructionsTracker.addStep()
                    } label: {
                        Text("Add step")
                    }
                    Button {
                        instructionsTracker.removeStep()
                    } label: {
                        Text("Remove step")
                    }
                }
                Divider()
                Button {
                    instructions = instructionsTracker.convertToString()
                    print(instructions)
                } label: {
                    Text("Set instructions")
                }
            }
        }
    }
}

struct InstructionsForm_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsForm(instructionsTracker: InstructionsTracker(), instructions: .constant(""))
    }
}
