//
//  ViewController.swift
//  ProtocolGetSetVarLet
//
//  Created by Milos on 12/26/18.
//  Copyright © 2018 Milos. All rights reserved.
//

import UIKit
class ViewController: UIViewController {}

// Example #1

protocol Wheel {
    var model: String { get } // get
    var price: Int { get set } // get set
}
struct GoodYear: Wheel {
    let model: String // allowed to declare as let or var, we decide to declare it as let to "be consistent" with its get-only nature
    var price: Int // allowed to declare as var
}
let goodYear = GoodYear(model: "w33r1", price: 15)

// Example #2

protocol FullyNamed {
    var fullName: String { get } // get
}
struct Detective: FullyNamed {
    var fullName: String // allowed to declare as let or var, we decide to declare it as var even it's get-only property
    
    init(fullName: String) {
        self.fullName = fullName
    }
    
    mutating func renameWith(fullName: String) {
        self.fullName = fullName
    }
}

func demo() {
    var detective = Detective(fullName: "Holmes") // If we declare detective as struct Detective, it will pick up
    _ = detective.fullName // returns "Holmes"
    
    detective.fullName = "Giga Moravac"
    _ = detective.fullName // returns "Giga Moravac"
    
    detective.renameWith(fullName: "Sherlock Holmes")
    print(detective.fullName) // returns "Sherlock Holmes"
    
    
    let d: FullyNamed = Detective(fullName: "Sherlock Holmes") // If we declare "d" explicitly as FullyNamed, it will pick up fullName as get-only
    _ = d.fullName // returns "Sherlock Holmes"
    
    /*
     d.fullName = "Giga Moravac" // Cannot assign to property: 'fullName' is a get-only property
     d.renameWith(fullName: "Giga Moravac") // Value of type 'FullyNamed' has no member 'renameWith'
     **/
}
