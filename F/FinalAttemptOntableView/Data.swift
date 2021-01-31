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
            "Hand luggage",
            "Suit Case",
            "BackPack"
        ],
        subtitle:"Please Select an Item to add" ,
        isExpendebale: false,
        productQty: [
            "Hand luggage":0,
            "Suit Case":0,
            "BackPack":0
    ]),
    
   Section(
    pid : 5,
    luggageName:"Household Items",
    NoofItem:[
              "TV (less than 30 inches)",
              "TV (30 to 60 inches)",
              "Ironing board",
              "Music speaker (Large)",
              "Mirror (upto 60x36 inches)",
              "Chest of drawers",
              "Rug (upto 24x84 inches)",
              "Single Mattress",
              "Bedside table ",
              "Microwave oven",
              "Vacuum cleaner",
              "TV stand",
              "Large musical instrument"
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: [
        "TV (less than 30 inches)":0,
        "TV (30 to 60 inches)":0,
        "Ironing board":0,
        "Music speaker (Large)":0,
        "Mirror (upto 60x36 inches)":0,
        "Chest of drawers":0,
        "Rug (upto 24x84 inches)":0,
        "Single Mattress":0,
        "Bedside table ":0,
        "Microwave oven":0,
        "Vacuum cleaner":0,
        "TV stand":0,
        "Large musical instrument":0
    ]),
   
   Section(
    pid : 2,
    luggageName:"Boxes",
    NoofItem:[
      "Small Box",
        "Medium Box",
        "Large Box",
        "XL Box"
        ],
    subtitle: "Please Select an Item to add",
    isExpendebale:false ,
    productQty: [
        "Small Box":0,
        "Medium Box":0,
        "Large Box":0,
        "XL Box":0
      ]),
   
   Section(
    pid : 3,
    luggageName:"Child Items",
    NoofItem:[
        "Childs Pram's",
               "Child's Foldable Pushchair"
        ],
    subtitle:"Please Select an Item to add" ,
    isExpendebale:false ,
    productQty: [
        "Childs Pram's":0,
        "Child's Foldable Pushchair":0
    ]),
   
   Section(
    pid : 4,
    luggageName:"Folded WheelChair",
    NoofItem:[
        "Folded WheelChair"
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false ,
    productQty:[
        "Folded WheelChair":0
    ]),
   
   Section(
    pid : 6,
    luggageName:"Outdoor Items",
    NoofItem: [
        "Tent",
        "Large Rucksack",
        "Pair of skis",
        "Snowboard",
        "Bike",
        "Bike box",
        "Golf bag"
    ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: [
        "Tent":0,
        "Large Rucksack":0,
        "Pair of skis":0,
        "Snowboard":0,
        "Bike":0,
        "Bike box":0,
        "Golf bag":0
    ]),
   
   Section(
    pid : 7,
    luggageName:"Pets",
    NoofItem: [
         "Small Pet (in cage)",
        "Large Dog"
        ],
    subtitle: "Please Select an Item to add",
    isExpendebale: false,
    productQty: [
        "Small Pet (in cage)":0,
        "Large Dog":0
    ] )
]
