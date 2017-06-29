//
//  AskTableViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/29.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class AskTableViewController: UITableViewController {
    var productName : String?
    var productField : UITextField?
    var placeField: UITextField?
    var nameField:UITextField?
    var teleField:UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(productName) 询价"
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = borderColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
            productField = (cell?.viewWithTag(1) as! UITextField)
            productField?.delegate = self
        }else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
            placeField = cell?.viewWithTag(1) as? UITextField
            placeField?.delegate = self
        }else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
            nameField = cell?.viewWithTag(1) as? UITextField
            nameField?.delegate = self
        }else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "teleCell", for: indexPath)
            teleField = cell?.viewWithTag(1) as? UITextField
            teleField?.delegate = self
        }else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCell(withIdentifier: "submitCell", for: indexPath)
            let submitBtn = cell?.viewWithTag(1) as! UIButton
            submitBtn.backgroundColor = mainColor
            submitBtn.layer.cornerRadius = 5.0
            submitBtn.layer.masksToBounds = true
            submitBtn.addTarget(self, action: #selector(AskTableViewController.submit), for: .touchUpInside)
        }
        

        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: false)
        if indexPath.row == 2 {
            nameField?.becomeFirstResponder()
        }
        if indexPath.row == 3 {
            teleField?.becomeFirstResponder()
        }
        if indexPath.row == 4 {
            submit()
        }
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

    func submit() {
        
    }
}
extension AskTableViewController : UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if textField == productField {
            return false
        }
        if textField == placeField {
            return false
        }
        return true
    }
}
