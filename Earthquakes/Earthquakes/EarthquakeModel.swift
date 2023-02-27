//
//  EarthquakeModel.swift
//  Earthquakes
//
//  Created by Nathan Gendler on 1/11/23.
//

import Foundation

let lastWeek = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson"
let allMonth = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"

func loadData(){
    let apiURL = URL(string: lastWeek)!
    let request = URLRequest(url: apiURL)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        do{
            if let data = data {
                
                let dataString = String(data:data, encoding: .utf8)!
                print("-------")
                print(dataString)
                
                let earthquakes = try JSONDecoder().decode(Earthquakes.self, from: data)
                print(earthquakes)
            }
        } catch{
            print(error)
        }
    }
    task.resume()
}

func loadEarthquakes(completion: @escaping (Earthquakes) -> Void){
    let apiURL = URL(string: lastWeek)!
    let request = URLRequest(url: apiURL)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        do{
            if let data = data {
                
                let dataString = String(data:data, encoding: .utf8)!
                print("-------")
                print(dataString)
                
                let earthquakes = try JSONDecoder().decode(Earthquakes.self, from: data)
                print(earthquakes)
                
                completion(earthquakes)
            }
        } catch{
            print(error)
        }
    }
    task.resume()
}

