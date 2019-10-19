//
//  ViewController.swift
//  Todoey
//
//  Created by Gregory Steed on 10/14/19.
//  Copyright © 2019 Gregory Steed. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Find Fun Things","Buy Eggs","Destroy Demogoragon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  //Mark - Tableview Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    print(itemArray[indexPath.row].description)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
//Mark - Action add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newInput = UITextField()

        print(newInput)
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // new code goes here
            self.itemArray.append(newInput.text!)
            self.tableView.reloadData() 
            print (newInput)
            print("Success!!")
        }
        alert.addTextField { (alertTextField) in
           newInput = alertTextField
            
        }
        print("This is the after entry \(newInput)")
       alert.addAction(action)
       present(alert, animated: true, completion: nil)
       
    }
     
}

