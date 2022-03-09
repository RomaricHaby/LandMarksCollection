//
//  DataModel.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import Foundation


class DataModel {
    public static let sharedInstance = DataModel()
    
    var landMarksList = Array<LandMark>()
    
    func loadChecklist(){
        let filename = Bundle.main.url(forResource: "landmarkData", withExtension: ".json")!
        do {
            let data = try Data(contentsOf: filename)
            landMarksList = try JSONDecoder().decode(Array<LandMark>.self, from: data)
        } catch  {
            print("Unable to load saved data.")
        }
    }
    
    func getFavLandMarks() -> Array<LandMark>{
        var landMarksListFav = Array<LandMark>()
        
        for landMark  in landMarksList {
            if landMark.isFavorite {
                landMarksListFav.append(landMark)
            }
        }
        return landMarksListFav
    }
    
    func getLandMarksMountains() -> Array<LandMark>{
        var landMarksListMountains = Array<LandMark>()
        
        for landMark  in landMarksList {
            if landMark.category == LandMark.Category.mountains {
                landMarksListMountains.append(landMark)
            }
        }
        return landMarksListMountains
    }
    
    func getLandMarksLakes() -> Array<LandMark>{
        var landMarksListMountains = Array<LandMark>()
        
        for landMark  in landMarksList {
            if landMark.category == LandMark.Category.lakes {
                landMarksListMountains.append(landMark)
            }
        }
        return landMarksListMountains
    }
    
    func getLandMarksRivers() -> Array<LandMark>{
        var landMarksListMountains = Array<LandMark>()
        
        for landMark  in landMarksList {
            if landMark.category == LandMark.Category.rivers {
                landMarksListMountains.append(landMark)
            }
        }
        return landMarksListMountains
    }
}
