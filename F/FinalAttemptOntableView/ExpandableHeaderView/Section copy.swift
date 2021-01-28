//
//  Section.swift
//  TabelViewExpandAndCollapesSliderBar
//
//  Created by mac on 1/7/21.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation

class Sections: Codable {
    let sections : [Section]
    
    init(sections : [Section]) {
        self.sections = sections
    }
}



class Section : Codable {
        
     var pid : Int
     var productQty : Int
     var category: String
    var productName: [[Int:String]]
     var subtitle : String
     var isExpendebale : Bool!
     
    
    init(pid :Int , luggageName: String, NoofItem: [[Int:String]], subtitle : String, isExpendebale : Bool, productQty: Int ) {
        
        self.pid = pid
        self.productQty = productQty
        self.category = luggageName
        self.productName = NoofItem
        self.subtitle = subtitle
        self.isExpendebale = isExpendebale
        
        
    }
        

}
