//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by vagelis spirou on 01/10/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi {
    
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                
                debugPrint(error.localizedDescription)
                completion(nil)
                return
                
            }
            
            guard let data = response.data else {
                completion(nil)
                return
                
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
                
            } catch {
                
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            
            
        }
        
        
    }
    
    
}
