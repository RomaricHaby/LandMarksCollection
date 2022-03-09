//
//  Coordinates.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import Foundation

class Coordinates : Codable {
    var longitude : Double
    var latitude : Double
    
    init(longitude : Double , latitude : Double){
        
         self.longitude = longitude
        self.latitude = latitude
     }
}
