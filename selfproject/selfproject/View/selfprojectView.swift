//
//  selfprojectView.swift
//  selfproject
//
//  Created by Nathan Gendler on 1/20/23.
//

import SwiftUI


struct selfprojectView: View {
    @State var resultData: Results?
    @State var resultdata: Result?
    @State var refresh: Bool = false
    
    @State var one: Int = Int.random(in: 0...19)
    @State var two: Int = Int.random(in: 0...19)
    @State var three: Int = Int.random(in: 0...19)
    
    
    @State private var i: Int = Int.random(in: 0...19)
    @State private var x: Int = 0
    @State private var y: Bool = Bool.random()
    @State private var a: Int = Int.random(in: 0...19)
    @State private var answer: Int = 0;
    @State private var shuffledDrivers = [String]()
    @State private var drivers = [String]()
    
    
    func loadDrivers(){
        drivers.append("\(resultData!.mrData.raceTable.races[0].results[i].driver.givenName)\(resultData!.mrData.raceTable.races[0].results[i].driver.familyName)")
        for _ in 1...3
        {
            self.a = Int.random(in: 0...19)
            drivers.append("\(resultData!.mrData.raceTable.races[0].results[a].driver.givenName)\(resultData!.mrData.raceTable.races[0].results[a].driver.familyName)")
        }
        drivers.shuffle()
        
    }
    
    
    var body: some View {
        
        if let resultData = resultData{
            Text("F! Drivers Quiz")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.17))
            VStack {
                Button(action: {
                    x += 1
                }) {
                    Text("New Hint")
                }
                
                if(x >= 0)
                {
                    Text("Birthday: \(resultData.mrData.raceTable.races[0].results[i].driver.dateOfBirth)")
                }
                if(x >= 1)
                {
                    Text("Position in Monaco Grand Prix:  \(resultData.mrData.raceTable.races[0].results[i].position)")
                }
                if(x >= 2)
                {
                    Text("Team Name:  \(resultData.mrData.raceTable.races[0].results[i].constructor.name)")
                }
                if(x >= 3)
                {
                    Text("Nationality:  \(resultData.mrData.raceTable.races[0].results[i].driver.nationality)")
                }
                if(x >= 4)
                {
                    Text("Driver name:  \(resultData.mrData.raceTable.races[0].results[i].driver.givenName) \(resultData.mrData.raceTable.races[0].results[i].driver.familyName)")
                }
                
                Button(action: {
                    self.i = Int.random(in: 0...19)
                    self.a = Int.random(in: 0...19)
                    answer = 0
                    x = 0
                    drivers.append("\(resultData.mrData.raceTable.races[0].results[i].driver.givenName)\(resultData.mrData.raceTable.races[0].results[i].driver.familyName)")
                    for _ in 1...3
                    {
                        self.a = Int.random(in: 0...19)
                        drivers.append("\(resultData.mrData.raceTable.races[0].results[a].driver.givenName)\(resultData.mrData.raceTable.races[0].results[a].driver.familyName)")
                    }
                    drivers.shuffle()
                    
                }) {
                    
                    Text("Generate Random Driver")
                }
                Divider()
            }
            
            VStack
            {
                HStack{
                    if(refresh == false)
                    {
                        Button(action: {
                            answer = 1
                        }) {
                            
                            Text("\(resultData.mrData.raceTable.races[0].results[i].driver.givenName)\(resultData.mrData.raceTable.races[0].results[i].driver.familyName)")
                        }
                        Button(action: {
                            answer = 2
                        }) {
                            
                            Text("\(resultData.mrData.raceTable.races[0].results[a].driver.givenName)\(resultData.mrData.raceTable.races[0].results[a].driver.familyName)")
                        }
                        
                    }
                    else{
                        Button(action: {
                            answer = 1
                        }) {
                            
                            Text("\(resultData.mrData.raceTable.races[0].results[a].driver.givenName)\(resultData.mrData.raceTable.races[0].results[a].driver.familyName)")
                        }
                        Button(action: {
                            answer = 1
                        }) {
                            
                            Text("\(resultData.mrData.raceTable.races[0].results[i].driver.givenName)\(resultData.mrData.raceTable.races[0].results[i].driver.familyName)")
                        }
                    }
                }
                if(answer == 1)
                {
                    Text("Correct")
                    
                }
                else if(answer == 2){
                    Text("Wrong")
                }
            }
        }
        
        
        
        else{
            Image(systemName: "magnifyingglass.circle.fill")
            Text("Loading...")
                .onAppear(perform: {
                    loadResults { (results) in
                        self.resultData = results
                        loadDrivers()
                    }
                })
        }
    }
}


struct selfprojectView_Previews: PreviewProvider {
    static var previews: some View {
        selfprojectView()
    }
}
