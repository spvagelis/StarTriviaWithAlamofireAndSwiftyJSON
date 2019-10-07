//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by vagelis spirou on 30/09/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(person.name)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
