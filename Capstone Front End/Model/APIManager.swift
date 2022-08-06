//
//  APIManager.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/3/22.
//

import Foundation

class APIManager: ObservableObject {
    
    
    func getAllRecipes() async -> [Recipe] {
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/recipes")else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url:url)
        
        do {
            let(data, response) = try await URLSession.shared.data(for:urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decodedData = try JSONDecoder().decode([Recipe].self, from:data)
            return decodedData
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func getAllMolds() async -> [Mold] {
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/molds")else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url:url)
        
        do {
            let(data, response) = try await URLSession.shared.data(for:urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decodedData = try JSONDecoder().decode([Mold].self, from:data)
            return decodedData
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func getAllCategories() async -> [Category] {
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/categories")else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url:url)
        
        do {
            let(data, response) = try await URLSession.shared.data(for:urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decodedData = try JSONDecoder().decode([Category].self, from:data)
            return decodedData
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func getAllLocations() async -> [Location] {
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/locations")else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url:url)
        
        do {
            let(data, response) = try await URLSession.shared.data(for:urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decodedData = try JSONDecoder().decode([Location].self, from:data)
            return decodedData
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func getAllIngredients() async -> [Ingredient] {
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/ingredients")else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url:url)
        
        do {
            let(data, response) = try await URLSession.shared.data(for:urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decodedData = try JSONDecoder().decode([Ingredient].self, from:data)
            return decodedData
        } catch {
            fatalError("Fatal error: \(error)")
        }
    }
    
    func addNewMold(wellShape: String, wellVolume: Int, numWells: Int, source: String) async throws{
        let body: [String : Any] = [
            "well_shape": wellShape,
            "well_volume_grams": wellVolume,
            "num_wells": numWells,
            "source": source
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/molds")else{fatalError("Missing URL")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 201 else{
            fatalError("Error creating entry")
        }
    }
    
    func addNewRecipe(name: String, description: String, category: String, location: String, instructions: String, ingredients: [String:Int]) async throws{
        let body: [String : Any] = [
            "recipe_name": name,
            "recipe_description": description,
            "category": category,
            "location": location,
            "recipe_instructions" : instructions,
            "ingredient_info" : ingredients
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url=URL(string: "https://diy-skincare-app.herokuapp.com/recipes")else{fatalError("Missing URL")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 201 else{
            fatalError("Error creating entry")
        }
    }
    
}
