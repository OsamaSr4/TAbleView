//
//  Model.swift
//  FinalAttemptOntableView
//
//  Created by mac on 1/28/21.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation

class Section: Codable {
    let sections : [Sections]

    init(sections : [Sections]) {
        self.sections = sections
    }
}



struct Sections : Codable {
        
     var pid : Int
     var productQty : Int
     var category: String
    var productName: [Int:String]
     var subtitle : String
     var isExpendebale : Bool!
     
    
    init(pid :Int , luggageName: String, NoofItem: [Int: String], subtitle : String, isExpendebale : Bool, productQty: Int ) {
        
        self.pid = pid
        self.productQty = productQty
        self.category = luggageName
        self.productName = NoofItem
        self.subtitle = subtitle
        self.isExpendebale = isExpendebale
        
        
    }
        

}
