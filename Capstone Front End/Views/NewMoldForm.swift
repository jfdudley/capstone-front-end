//
//  NewMoldForm.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/4/22.
//

import SwiftUI
import Combine

struct NewMoldForm: View {
    @Binding var molds: [Mold]
    @StateObject var apiManager: APIManager
    
    @State var wellShape: String = ""
    @State var wellVolume: Int = 0
    @State var numWells: Int = 0
    @State var source: String = ""
    @State var addStatus: Bool = false

    var validateData: Bool {
        self.wellShape.isEmpty || self.wellVolume == 0 || self.numWells == 0 || self.source.isEmpty
    }
    
    func resetState() {
        self.wellShape = ""
        self.wellVolume = 0
        self.numWells = 0
        self.source = ""
    }
    var body: some View {
        if !addStatus {
            Form {
                Section {
                    TextField("Mold well shape", text: $wellShape)
                    TextField("Well volume, in grams", value: $wellVolume, formatter:NumberFormatter()).keyboardType(.numberPad)
                    Stepper(value: $numWells){Text("Number of wells: \(numWells)")}
                    TextField("Source", text: $source)
        
                }
                Section {
                    Button {
                        Task {
                            try await apiManager.addNewMold(wellShape: wellShape, wellVolume: wellVolume, numWells: numWells, source: source)
                            addStatus.toggle()
                            resetState()
                            molds = await apiManager.getAllMolds()
                        }
                    } label: {
                        Text("Add new mold!")
                    }

                }.disabled(validateData)
            }
        }
        else {
            VStack{
                Spacer()
            Text("Mold successfully submitted!")
                Spacer()
            Button {
                addStatus.toggle()
            } label: {
                Text("Add another mold?")
            }
                Spacer()
            }

        }
        
    }


struct NewMoldForm_Previews: PreviewProvider {
    static var previews: some View {
        NewMoldForm(molds: .constant(previewMolds), apiManager: APIManager())
    }
}
}