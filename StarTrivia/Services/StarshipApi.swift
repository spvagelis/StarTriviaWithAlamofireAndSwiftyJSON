//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by vagelis spirou on 02/10/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    
    func getStarship(url: String, completion: @escaping StarshipResponseCompetion) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.error {
                
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
                
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
                
                
            } catch {
                
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            
            
        }
        
        
    }
    
    
    
}
