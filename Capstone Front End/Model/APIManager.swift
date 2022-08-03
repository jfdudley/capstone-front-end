//
//  APIManager.swift
//  Capstone Front End
//
//  Created by Joanna Dudley on 8/3/22.
//

import Foundation

class APIManager: ObservableObject {
//    @Published var recipes : [Recipe] = []
//    @Published var molds : [Mold] = []
    
    
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
    
}
