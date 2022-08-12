//
//  NewRecipeForm.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/5/22.
//

import SwiftUI



struct NewRecipeForm: View {
    
    @Binding var recipes : [Recipe]
    @StateObject var apiManager : APIManager
    @State var databaseIngredients : [Ingredient] = []
    @State var databaseCategories : [Category] = []
    @State var databaseLocations : [Location] = []
    @ObservedObject var instructionsTracker = InstructionsTracker()
    @ObservedObject var ingredientsTracker = IngredientsTracker()
    @Binding var navText : Color
    
    
    @State var name: String = ""
    @State var description: String = ""
    @State var category: String = ""
    @State var location: String = ""
    @State var ingredients: [String:Double] = [:]
    @State var instructions: String = ""
    
    @State var addStatus: Bool = false
    @State var newCategory: Bool = false
    @State var newLocation: Bool = false
    
    var validateData: Bool {
        self.name.isEmpty || self.description.isEmpty || self.category.isEmpty || self.location.isEmpty || self.instructions.isEmpty || self.ingredients.isEmpty
    }
    
    
    func resetState() {
        self.name = ""
        self.description = ""
        self.category = ""
        self.location = ""
        self.ingredients = [:]
        self.instructions = ""
        instructionsTracker.resetTracker()
        ingredientsTracker.resetTracker()
    }
    
    
    
    
    var body: some View {
        if !addStatus {
            VStack {
                Text("Add a new recipe:").font(.title2).foregroundColor(.white)
                Form {
                    Section {
                        TextField("Recipe name", text: $name)
                        TextField("Recipe description", text: $description)
                        if !newCategory {
                            Picker("Select Category", selection: $category){
                                ForEach(databaseCategories, id: \.self){category in
                                    Text("\(category.name)").tag(category.name)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        } else {
                            TextField("New category name", text: $category)
                        }
                        Toggle(isOn: $newCategory) {
                            Text("Add new category")
                        }
                        if !newLocation {
                            Picker("Select Location", selection: $location){
                                ForEach(databaseLocations, id: \.self){location in
                                    Text("\(location.name)").tag(location.name)
                                }
                            }
                                .pickerStyle(SegmentedPickerStyle())

                        } else {
                            TextField("New location name", text: $location)
                        }
                        Toggle(isOn: $newLocation) {
                            Text("Add new location")
                        }
                    }
                    Section {
                        if ingredients.isEmpty {
                            NavigationLink {
                                IngredientsForm(ingredients:$ingredients, ingredientList: $databaseIngredients, ingredientTracker: ingredientsTracker)
                            } label: {
                                Text("Add Ingredients")
                            }
                        }
                        else {
                            Text(ingredientsTracker.convertToString())
                            Divider()
                            NavigationLink {
                                IngredientsForm(ingredients:$ingredients, ingredientList: $databaseIngredients, ingredientTracker: ingredientsTracker)
                            } label: {
                                Text("Edit Ingredients")
                            }
                        }
                    }
                    Section {
                        if instructions.isEmpty {
                            NavigationLink {
                                InstructionsForm(instructionsTracker: instructionsTracker, instructions: $instructions)
                            } label: {
                                Text("Add Instructions")
                            }
                        }
                        else {
                            Text("\(instructions)")
                            Divider()
                            NavigationLink {
                                InstructionsForm(instructionsTracker: instructionsTracker, instructions: $instructions )
                            } label: {
                                Text("Edit Instructions")
                            }
                            
                        }
                    }
                    Section {
                        Button {
                            Task {
                                instructions = instructionsTracker.convertToString()
                                try await apiManager.addNewRecipe(name:name, description: description, category:category, location:location, instructions:instructions, ingredients:ingredients)
                                addStatus.toggle()
                                resetState()
                                recipes = await apiManager.getAllRecipes()
                            }
                        } label: {
                            Text("Add recipe").fontWeight(.bold)
                        }
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment:.center).disabled(validateData)
                }.foregroundColor(Color("BdazzledBlue"))
            }.background(Color("BdazzledBlue"))
            .task {
                databaseIngredients = await apiManager.getAllIngredients()
                databaseCategories = await apiManager.getAllCategories()
                databaseLocations = await apiManager.getAllLocations()
            }
        }
        else {
            VStack{
                Spacer()
                Text("Recipe successfully submitted!").foregroundColor(Color("BdazzledBlue")).font(.title3)
                Button {
                    addStatus.toggle()
                } label: {
                    Text("Add another recipe?")
                }.buttonStyle(.bordered).foregroundColor(.white).background(Color("BdazzledBlue")).cornerRadius(10).padding()
                Spacer()
            }.onAppear{
                navText = Color("BdazzledBlue")
            }.onDisappear{
                navText = .white
            }
            
        }
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm(recipes: .constant(previewRecipes), apiManager: APIManager(), navText: .constant(.white))
    }
}
