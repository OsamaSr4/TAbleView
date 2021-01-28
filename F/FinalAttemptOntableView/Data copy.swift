//
//  Data.swift
//  FinalAttemptOntableView
//
//  Created by mac on 1/16/21.
//  Copyright © 2021 mac. All rights reserved.
//

import Foundation

var sections = [
    
    Section(
        pid : 1,
        luggageName:"Luggage",
        NoofItem:[
            [1:"Hand luggage"],
            [2:"Suit Case"],
            [3:"BackPack"]
        ],
        subtitle:"Please Select an Item to add" ,
        isExpendebale: false,
        productQty: 0),
   
   Section(
    pid : 2,
    luggageName:"Boxes",
    NoofItem:[
        [4:"Small Box"],
        [5:"Medium Box"],
        [6:"Large Box"],
        [7:"XL Box"]
        ],
    subtitle: "Please Select an Item to add",
    isExpendebale:false ,
    productQty: 0),
   
   Section(
    pid : 3,
    luggageName:"Child Items",
    NoofItem:[
        [8:"Childs Pram's"],
        [9:"Child's Foldable Pushchair"]
        ],
    subtitle:"Please Select an Item to add" ,
    isExpendebale:false ,
    productQty: 0),
   
   Section(
    pid : 4,
    luggageName:"Folded WheelChair",
    NoofItem:[
        [10:"Folded WheelChair"]
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false ,
    productQty: 0),
   
   Section(
    pid : 5,
    luggageName:"Household Items",
    NoofItem:[
              [11:"TV (less than 30 inches)"],
              [12:"TV (30 to 60 inches)"],
              [13:"Ironing board"],
              [14:"Music speaker (Large)"],
              [15:"Mirror (upto 60x36 inches)"],
              [16:"Chest of drawers"],
              [17:"Rug (upto 24x84 inches)"],
              [18:"Single Mattress"],
              [19:"Bedside table (45x55cm)"],
              [20:"Microwave oven"],
              [21:"Vacuum cleaner"],
              [22:"TV stand"],
              [23:"Large musical instrument case (upto 60x24 inches)"]
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: 0),
   
   Section(
    pid : 6,
    luggageName:"Outdoor Items",
    NoofItem: [
        [24:"Tent"],
        [25:"Large Rucksack"],
        [26:"Pair of skis"],
        [27:"Snowboard"],
        [28:"Bike"],
        [29:"Bike box"],
        [30:"Golf bag"]
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: 0),
   
   Section(
    pid : 7,
    luggageName:"Pets",
    NoofItem: [
        [31:"Small Pet (in cage)"],
         [32:"Large Dog"]
        ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: 0 )
]
