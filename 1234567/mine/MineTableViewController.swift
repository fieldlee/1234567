//
//  MineTableViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/23.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class MineTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
           return 1
        }else if section == 1{
            return 2
        }else {
            return 4
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15.0
        }else if section == 1{
            return 15.0
        }else{
            return 0.0
        }
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180.0
        }else {
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath)
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "pushCell", for: indexPath)
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "clearCell", for: indexPath)
            }
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)
            }else if indexPath.row == 1{
                cell = tableView.dequeueReusableCell(withIdentifier: "appStoreCell", for: indexPath)
            }else if indexPath.row == 2 {
                cell = tableView.dequeueReusableCell(withIdentifier: "updateCell", for: indexPath)
            }else {
                cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath)
            }
        }
        return cell!
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
