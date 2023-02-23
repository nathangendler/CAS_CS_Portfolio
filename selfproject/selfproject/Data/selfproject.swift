//
//  selfprojectModel.swift
//  selfproject
//
//  Created by Nathan Gendler on 1/20/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let results = try? JSONDecoder().decode(Results.self, from: jsonData)

//
//  EarthquakeModel.swift
//  Earthquakes
//
//  Created by Nathan Gendler on 1/11/23.
//

import Foundation

let racefive = "https://ergast.com/api/f1/2021/1/results.json"

func loadData(){
    let apiURL = URL(string: racefive)!
    let request = URLRequest(url: apiURL)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        do{
            if let data = data {
                
                let dataString = String(data:data, encoding: .utf8)!
                print("-------")
                print(dataString)
                
                let results = try JSONDecoder().decode(Results.self, from: data)
                print(results)
            }
        } catch{
            print(error)
        }
    }
    task.resume()
}

func loadResults(completion: @escaping (Results) -> Void){
    let apiURL = URL(string: racefive)!
    let request = URLRequest(url: apiURL)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        do{
            if let data = data {
                    
                let dataString = String(data:data, encoding: .utf8)!
                print("-------")
                print(dataString)
                    
                let results = try JSONDecoder().decode(Results.self, from: data)
                print(results)
                    
                completion(results)
            }
        } catch{
            print(error)
        }
    }
    task.resume()
}




