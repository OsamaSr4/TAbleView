//
//  ItemsCollectionViewCell.swift
//  FinalAttemptOntableView
//
//  Created by mac on 1/30/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

struct Objects {

    var nameOfluggage : String?
    var TotalItems : String?
    
    static var shared = Objects()

    mutating func initWithDictValues(_ currentRate : Objects) {
        self.nameOfluggage = currentRate.nameOfluggage
        self.TotalItems = currentRate.TotalItems
    }
}

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var NameOfItems: UILabel!
    @IBOutlet var QuantityOfItems: UILabel!
    
    @IBOutlet var deleteButton: UIButton!
    
}
