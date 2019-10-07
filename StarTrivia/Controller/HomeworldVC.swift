//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by vagelis spirou on 30/09/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    var person: Person!
    let api = HomeworldApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            
            if let homeworld = homeworld {
                
                self.updateUI(homeworld: homeworld)
                
            }
            
        }
        
    }
    
    func updateUI(homeworld: Homeworld) {
        
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
        
    }

}
