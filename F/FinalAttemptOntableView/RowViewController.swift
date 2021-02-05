//
//  RowViewController.swift
//  FinalAttemptOntableView
//
//  Created by mac on 1/16/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class itemss : UITableViewCell {
    
    @IBOutlet var itemsLabel: UILabel!
    @IBOutlet var countStepper: UIStepper!
    
    override func awakeFromNib() {
           super.awakeFromNib()
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)}
}


class RowViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
     
    @IBOutlet var tableView: UITableView!

    @IBOutlet var collectionViews: UICollectionView!
    
    
    var selectIndexPath : IndexPath!
    var product : [String:String] = [:]
    var aQuntity : Float = 0
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.Plist")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectIndexPath = IndexPath(row: -1, section: -1)
        tableView.register(UINib(nibName: "ExpandableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "expandableHeaderView")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let containerView = tableView.headerView(forSection: indexPath.section) as? ExpandableHeaderView else { return 0}
        if sections[indexPath.section].isExpendebale {
            DispatchQueue.main.async {
                containerView.openArrow()
            }
            return UITableView.automaticDimension
        } else {
            DispatchQueue.main.async {
                containerView.closeArrow()
            }
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "expandableHeaderView") as! ExpandableHeaderView
        headerView.delegate = self
        headerView.section = section
        headerView.custominit(title: sections[section].category, subtitle: sections[section].subtitle, section: section, delegate: self)
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].productName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? itemss
        cell?.countStepper.value = Double(Int(aQuntity))
        cell?.countStepper?.tag = (indexPath.section * 13) + indexPath.row
        cell?.countStepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        cell?.itemsLabel.text = String(aQuntity)
        cell?.textLabel?.text = sections[indexPath.section].productName[indexPath.row]
        return cell!
    }
    
    @objc func stepperAction(_ sender: UIStepper) {
    let row : Int = sender.tag % 13
    let  sec : Int = sender.tag / 13
    
    let cell = tableView.cellForRow(at: IndexPath(row: row, section: sec) ) as! itemss
    if sec == 0 {
        sender.maximumValue = 8
    }
    else if sec == 1 {
        sender.maximumValue = 4
    }
    else if sec == 2 {
        sender.maximumValue = 4
    }
    else if sec == 3 && row == 1 || row == 0 {
        sender.maximumValue = 3
    }
    else if sec == 4 {
        sender.maximumValue = 3
    }
    else if sec == 5 {
        sender.maximumValue = 4
    }
    else if sec == 6 {
    sender.maximumValue = 4
    }
    if cell.textLabel!.text == sections[sec].productName[row]{
        product.updateValue(String(Int(sender.value)), forKey: (cell.textLabel?.text)!)
    }

    let value = Float(sender.value)
   cell.itemsLabel.text = String(value)
    collectionViews.self .reloadData()
    }
        
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return product.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectioncell = (collectionViews.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemsCollectionViewCell)!
    let keysArray = Array(product.keys)
    let arrayValues = Array(product.values)
    collectioncell.deleteButton.tag = indexPath.item
    collectioncell.NameOfItems.text = keysArray[indexPath.item]
    collectioncell.QuantityOfItems.text = arrayValues[indexPath.item]
    return collectioncell
    }
    
    
    @IBAction func deleteItemsButton(_ sender: UIButton) {
        let item : Int = sender.tag
        let coll = collectionViews.cellForItem(at: IndexPath(item: item, section: 0) ) as? ItemsCollectionViewCell
        product.removeValue(forKey: (coll?.NameOfItems.text)!)
        print(product)
        collectionViews.self .reloadData()
        tableView.self .reloadData()
    }
}







extension RowViewController: ExpandableHeaderViewDelegate {
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
         for theSection in 0..<sections.count {
                   if theSection == section {
                       sections[theSection].isExpendebale = !sections[section].isExpendebale
                   } else {
                       sections[theSection].isExpendebale = false
                   }
               }
           // collectionViews.self .reloadData()
        
               tableView.beginUpdates()
               tableView.endUpdates()
    }
}
