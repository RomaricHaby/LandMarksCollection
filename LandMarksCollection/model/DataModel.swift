//
//  DataModel.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import Foundation


class DataModel {
    public static let sharedInstance = DataModel()
    
    var landMarksList = Array<LandMarks>()
    
    

    func loadChecklist(){
        let filename = Bundle.main.url(forResource: "landmarkData", withExtension: ".json")!
        do {
            let data = try Data(contentsOf: filename)
            landMarksList = try JSONDecoder().decode(Array<LandMarks>.self, from: data)
        } catch  {
            print("Unable to load saved data.")
        }
    }
    
}
