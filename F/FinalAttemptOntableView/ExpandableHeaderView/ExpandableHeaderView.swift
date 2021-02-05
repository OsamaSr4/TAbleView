 //
//  ExpandableHeaderView.swift
//  TabelViewExpandAndCollapesSliderBar
//
//  Created by mac on 1/7/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

 protocol ExpandableHeaderViewDelegate {
    func toggleSection(header : ExpandableHeaderView , section : Int)

 }
 

class ExpandableHeaderView: UITableViewHeaderFooterView {

    var delegate: ExpandableHeaderViewDelegate?
    var section : Int!
    
    @IBOutlet weak var LuggageNametitle: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    
    @IBOutlet var arrowIcon: UIImageView!
    
    func common() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
 
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    required init?(coder : NSCoder) {
          super.init(coder: coder)
         self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    @objc func selectHeaderView(gesture: UITapGestureRecognizer)  {
        let cell  = gesture.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func custominit(title : String , subtitle : String , section : Int , delegate: ExpandableHeaderViewDelegate ) {
        self.LuggageNametitle.text = title
        self.SubTitle.text = subtitle
        self.section = section
        self.delegate = delegate
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.LuggageNametitle?.textColor = UIColor.white
        self.SubTitle?.textColor = UIColor.white
        self.SubTitle?.alpha =  0.7
        self.contentView.backgroundColor = UIColor.lightGray
    }
    
    func openArrow() {
        self.arrowIcon.image = #imageLiteral(resourceName: "upArrow")
    }
    
    func closeArrow() {
        self.arrowIcon.image = #imageLiteral(resourceName: "downArrow")
    }
 
 }
