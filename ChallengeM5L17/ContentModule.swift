//
//  ContentModule.swift
//  ChallengeM5L17
//
//  Created by Carlos Banza on 07/07/2021.
//

import Foundation

class ContentModule : ObservableObject{
    
    @Published var modules = [Module]()
    @Published var currentModule:Module?
    
    init() {
        getRemoteData()
    }
    
    func getRemoteData(){
        
        let urlData = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json")
        
        guard urlData != nil else {
            return
        }
        
        // create a URLRequest objet
        URLSession.shared.dataTask(with: URLRequest(url: urlData!)){ (data, response, error) in
            // Check if there's an error
            guard error == nil else{
                //There was an error
                return
            }
            
            // Handle the response
            do{
               let modules = try JSONDecoder().decode([Module].self, from: data!)
                DispatchQueue.main.async {
                    self.modules += modules
                }
                
            }catch{
                print(error)
            }
        }.resume()

    }
    
    //get module by id
    func getModuleById(_ id:Int){
        
        for index in 0..<modules.count{
            if modules[index].id == id{
                DispatchQueue.main.async {
                    self.currentModule = self.modules[id]
                }
                break
            }
        }
        
        self.currentModule = nil
    }
    
}
