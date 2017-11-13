//
//  ForumTableViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/22.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ForumTableViewController: UITableViewController {
    var headCollectionView : UICollectionView?
    var headCollectionLayout : UICollectionViewFlowLayout?
    let headCollectionIdentifier = "actionReuseId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = borderColor
        
        headCollectionLayout = UICollectionViewFlowLayout()
        headCollectionLayout?.scrollDirection = .horizontal
        headCollectionLayout?.minimumLineSpacing = 10
        
        let collectionViewFrame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: 105.0)
        headCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: headCollectionLayout!)
        headCollectionView?.showsVerticalScrollIndicator = false
        headCollectionView?.showsHorizontalScrollIndicator = false
        headCollectionView?.dataSource = self
        headCollectionView?.delegate = self
        headCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: headCollectionIdentifier)
        headCollectionView?.backgroundColor = UIColor.white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }else{
            return 5
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
             return 20.0
        }
       return 0.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath)
            let titleLab = cell?.viewWithTag(1) as! UILabel
            let moreBtn = cell?.viewWithTag(2) as! UIButton
            let colView = cell?.viewWithTag(3)
            colView?.addSubview(headCollectionView!)
        }
        else{
            if indexPath.row == 0 {
               cell = tableView.dequeueReusableCell(withIdentifier: "forumOneImageCell", for: indexPath)
            }else if indexPath.row == 1 {
                cell = tableView.dequeueReusableCell(withIdentifier: "forumOneBigImageCell", for: indexPath)
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "forumNoImageCell", for: indexPath)
            }
        }

        return cell!
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
           return 150.0
        }
        else{
            if indexPath.row == 0 {
                return 80.0
            }else if indexPath.row == 1 {
                return 180.0
            }else{
                return 70.0
            }
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

}
extension ForumTableViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.bounds.size.width/2, height: 105.0)
    }
}
extension ForumTableViewController : UICollectionViewDelegate{

}
extension ForumTableViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headCollectionIdentifier, for: indexPath)
        let imageFrame = CGRect(x: 0, y: 0, width: view.bounds.size.width / 2, height: 105.0)
        let imageForCell = UIImageView(frame: imageFrame)
        imageForCell.image = UIImage(named: "bannerpic")
        cell.addSubview(imageForCell)
        return cell
    }
    
}
