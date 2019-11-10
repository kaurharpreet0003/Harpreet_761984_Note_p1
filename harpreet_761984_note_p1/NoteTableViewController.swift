//
//  NoteTableViewController.swift
//  harpreet_761984_note_p1
//
//  Created by Megha Mahna on 2019-11-09.
//  Copyright © 2019 Harpreet. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    var array1 : [String]?
    @IBOutlet var table_view: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        array1 = [String]()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array1?.count ?? 0
    }

    @IBAction func NewFolder(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "Name"
        }
        let addItem = UIAlertAction(title: "Add Item", style: .default) { (UIAlertAction) in
            let textItem = alert.textFields![0]
            self.array1!.append(textItem.text!)
            self.table_view.reloadData()
            
        }
        alert.addAction(cancel)
        alert.addAction(addItem)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "reuse"){
            let cell1 = array1![indexPath.row]
            cell.imageView?.image = UIImage(named: "folder-icon")
            cell.textLabel!.text = cell1
            return cell
        }
        

        // Configure the cell...

        return UITableViewCell()
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            array1?.remove(at: indexPath.row)
            table_view.reloadData()
        }
        //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
  
    

  
//     //Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
    
  }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
