//
//  Landmarks.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import Foundation


class LandMarks : Codable {
    
    var name : String
    var category :String
    var city : String
    var state: String
    var id : Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var description : String
    var imageName : String
    var coordinates : Coordinates
    
    

    init(name : String,
         category :String,
         city : String,
         state: String,
         id : Int,
         isFeatured: Bool,
         isFavorite: Bool,
         park: String,
         description : String,
         imageName : String,
         coordinates : Coordinates){
           
        self.name = name
           self.category = category
           self.city = city
           self.state = state
           self.id = id
           self.isFeatured = isFeatured
           self.isFavorite = isFavorite
           self.park = park
           self.description = description
           self.imageName = imageName
           self.coordinates = coordinates
        }
   
    

}
