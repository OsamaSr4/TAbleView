//
//  Section.swift
//  TabelViewExpandAndCollapesSliderBar
//
//  Created by mac on 1/7/21.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation

class Sections {
    let sections : [Section]

    init(sections : [Section]) {
        self.sections = sections
    }
}



struct Section  {
        
     var pid : Int
    var productQty : [String:Int]
     var category: String
    var productName: [String]
     var subtitle : String
     var isExpendebale : Bool!
     
    
    init(pid :Int , luggageName: String, NoofItem: [String], subtitle : String, isExpendebale : Bool, productQty: [String:Int] ) {
        
        self.pid = pid
        self.productQty = productQty
        self.category = luggageName
        self.productName = NoofItem
        self.subtitle = subtitle
        self.isExpendebale = isExpendebale
        
        
    }
        

}
