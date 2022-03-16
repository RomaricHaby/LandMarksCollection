//
//  DetailLandMarkViewController.swift
//  LandMarksCollection
//
//  Created by lpiem on 16/03/2022.
//

import Foundation
import UIKit

class DetailLandMarkViewController : UIViewController{
    var landmark : LandMark!
    
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var nameLandMark: UILabel!
    
    @IBOutlet weak var descriptLandMark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = landmark.image
        nameLandMark.text = landmark.name
        descriptLandMark.text = landmark.description
     
    }
}
