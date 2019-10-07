//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by vagelis spirou on 30/09/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    var person: Person!
    let api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        starships = person.starshipUrls
        
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1
        
        guard let firstStarship = starships.first else { return }
        
        getStarship(url: firstStarship)
        
    }
    
    func updateUI(starship: Starship) {
        
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.maker
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        
        
    }
    
    func getStarship(url: String) {
        
        api.getStarship(url: url) { (starship) in
            
            if let starship = starship {
                
                self.updateUI(starship: starship)
                
            }
        }
    }
    
    func setButtonState() {
        
        if currentStarship == 0 {
            
            previousBtn.isEnabled = false
            
        } else {
            
            previousBtn.isEnabled = true
            
        }
        
        if currentStarship == starships.count - 1 {
            
            nextBtn.isEnabled = false
            
        } else {
            
            nextBtn.isEnabled = true
            
        }
        
        getStarship(url: starships[currentStarship])
        
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        
        currentStarship -= 1
        setButtonState()
        
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        currentStarship += 1
        setButtonState()
        
    }
    

}
