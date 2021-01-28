//
//  ViewController.swift
//  FinalAttemptOntableView
//
//  Created by mac on 1/16/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemsArray  : [String] = [""]
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.Plist")
    
    
    override func viewDidLoad() {
        //print(dataFilePath)
        super.viewDidLoad()
        
        loadData()
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(itemsArray)
        loadData()
        saveItems()
        print (itemsArray.count)
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(itemsArray[indexPath.row])
        tableView.reloadRows(at: [indexPath], with: .right)
        return cell
    }
    
    func saveItems(){
        
        let encoder = PropertyListEncoder()
               do{
                   let data = try encoder.encode(itemsArray)
                   try data.write(to: dataFilePath!)
                
               }catch{
                   print("Error encodeing Item Array  , \(error)")
               }
       // tableView.reloadData()
    }
    
    func loadData()  {
        
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                itemsArray = try decoder.decode([String].self, from: data)
                
            } catch {
                print("\(error)")
            }
            
        }
    }
    
}
    



