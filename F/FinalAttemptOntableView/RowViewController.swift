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


class RowViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ExpandableHeaderViewDelegate{
     
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalitems: UILabel!
    
    
    var selectIndexPath : IndexPath!
    var CartArray : [[String: String]] = []
    var itemsArray : [[String: AnyObject]] = []
    var product : [String:String] = [:]
    
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.Plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
        selectIndexPath = IndexPath(row: -1, section: -1)
        let nib = UINib(nibName: "ExpandableHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "expandableHeaderView")
    }
    func downloadJsonWithURL() {
        guard let path = Bundle.main.path(forResource: "generated", ofType: ".json") else {return}
        let url = URL(fileURLWithPath: path)
        URLSession.shared.dataTask(with: (url), completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary {
                
                self.itemsArray = (jsonObj.value(forKey: "Detail") as? [[String: AnyObject]])!
               // print(self.itemsArray)
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].isExpendebale){
            return 44
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "expandableHeaderView") as! ExpandableHeaderView
        headerView.custominit(title: sections[section].category, subtitle: sections[section].subtitle, section: section, delegate: self)
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].productName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? itemss
        //let sec = itemsArray[indexPath.section]
       // let arr = itemsArray[indexPath.section]
//
        let aQuntity : Float = 0
//        let itemId : Int =  arr["pid"] as! Int
//        for aDic in CartArray{
//            if aDic["id"] == String(itemId){
//               aQuntity = Float(String(aDic["quantity"]!))!
//            }
//        }
        
        cell!.countStepper.value = Double(Int(aQuntity))
        cell!.countStepper.tag = indexPath.row
        cell?.superview?.tag = indexPath.section
        cell!.countStepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        cell!.itemsLabel.text = String(aQuntity)
        totalitems.text = String(aQuntity )
        return cell!
        
    }
func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].isExpendebale = !sections[section].isExpendebale
        tableView.beginUpdates()
       // self.saveItems()
        tableView.endUpdates()
    }
    
    
@objc func stepperAction(_ sender: UIStepper) {
    let index : Int = sender.tag
    let  sec : Int = sender.superview!.tag
    print(sec)
    
    let arr = itemsArray[index]
    //print (arr)
    // let ar = arr["productName"] as! [Dictionary<String, String>]
   //print(ar)
    //let ketarray = ar.map {Array($0.keys)[0]}
   // print(ketarray)
  
 
    
       // print(arr)
    let cell = tableView.cellForRow(at: IndexPath(row: index, section: sec) ) as! itemss

                    let value = Float(sender.value)
                     cell.itemsLabel.text = String(value)
    
    
    let itemId : Int = (arr["pid"]) as! Int
   // print(itemId)
    //let itemnum : Int = 0
        var aFoundIndex : Int?
        var counter : Int = 0
        
        _ = CartArray.filter { (aDic) -> Bool in
            if aDic["id"] == String(itemId) {
            aFoundIndex = counter
            }
            counter += 1
            return false
        }
        
        if(aFoundIndex != nil){
        CartArray.remove(at: aFoundIndex!)
        }

        CartArray.append(["quantity" : String(value),"id" : String(itemId)])
        //print(CartArray)
      }


}
