//
//  asteroidsViewModel.swift
//  MVVM
//
//  Created by Nitish on 13/09/22.
//

import Foundation


class asteroidsViewModel {
    
    var vc: ViewController?
    var userArr = [nearObjects]()
    
    var asteroidCount = [Int]()
    var asteroiDatedCount = [String]()

    func asteroidsData(_ startDate: String, _ endDate: String, handler: @escaping (String,String) -> Void){
        
        
        URLSession.shared.dataTask(with: URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(startDate)&end_date=\(endDate)&api_key=45Slus7NNpHhdlL4jQzebSK0NrjlfDhr767iL3nA")!){data,response,error in
            if error == nil {
                if let data = data {
                do {
                    let userResposne = try JSONDecoder().decode(nearObjects.self, from: data)
                    self.asteroidCount.removeAll()
                    self.asteroiDatedCount.removeAll()
                    var greastest:Double = 0.0
                    for i in userResposne.nearEarthObjects.keys {
                        guard let modelData =  userResposne.nearEarthObjects[i] else {
                            return
                        }
                        for j in 0..<modelData.count {
                             
                            let kmData =   Double(modelData[j].closeApproachData[0].relativeVelocity.kilometersPerHour)
                            if greastest < kmData ?? 0.0{
                                greastest = kmData ?? 0.0
                            }

                        }
                        print(greastest)
                        self.asteroidCount.append(userResposne.nearEarthObjects[i]?.count ?? 0)
                        self.asteroiDatedCount.append(i)
                        
                    }

                    var totalNumber = 0
                    for asCount in self.asteroidCount {
                        
                        totalNumber += asCount
                    }
                    
                    handler(greastest.description, totalNumber.description)

                    print(self.asteroidCount) // Print 1
                    print(self.asteroiDatedCount) // Print 1
                    
                } catch let err   {
                    print("error \(err)")
                }
                }}else{
                print("error \(error?.localizedDescription)")
                }
        }.resume()
}
    
}

