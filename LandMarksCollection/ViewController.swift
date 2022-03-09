//
//  ViewController.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataModel.sharedInstance.loadChecklist()
        
       
    }


}

