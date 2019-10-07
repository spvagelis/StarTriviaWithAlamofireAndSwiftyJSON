//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by vagelis spirou on 30/09/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pxLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        
        getVehicle(url: firstVehicle)
        
    }
    
    func getVehicle(url: String) {
        
        api.getVehicle(url: url) { (vehicle) in
            
            if let vehicle = vehicle {
                
                self.updateUI(vehicle: vehicle)
                
            }
        }
        
    }
    
    func updateUI(vehicle: Vehicle) {
        
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        pxLbl.text = vehicle.passengers
        
    }
    
    func setButtonState() {
        
        if currentVehicle == 0 {
            
            previousBtn.isEnabled = false
            
        } else {
            
            previousBtn.isEnabled = true
            
        }
        
        if currentVehicle == vehicles.count - 1 {
            
            nextBtn.isEnabled = false
            
        } else {
            
            nextBtn.isEnabled = true
            
        }
        
        getVehicle(url: vehicles[currentVehicle])
        
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        
        currentVehicle -= 1
        setButtonState()
        
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        currentVehicle += 1
        setButtonState()
        
    }
    
    

}
