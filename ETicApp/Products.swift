//
//  Products.swift
//  ETicApp
//
//  Created by Bilal Candemir on 20.11.2019.
//  Copyright © 2019 Bilal Candemir. All rights reserved.
//

import Foundation

class Proudcts {
    var Id:Int
    var pName:String
    var pPrice:Int
    
    init(id:Int, name:String, price:Int) {
        self.Id = id
        self.pName = name
        self.pPrice = price
    }
}
