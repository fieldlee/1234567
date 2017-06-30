//
//  FindTableViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/22.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {
    let identifierForProduct = "identifierForProductCell"
    let identifierForBrand = "identifierForBrandCell"
    var masterProductsCollectionView : UICollectionView?
    var masterBrandCollectionView : UICollectionView?
    
    var masterProductsCollectionFlowLayout : UICollectionViewFlowLayout?
    var masterBrandCollectionFlowLayout : UICollectionViewFlowLayout?
    let indexOfList = ["主","热","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = borderColor
        
        // Do any additional setup after loading the view.
        masterProductsCollectionFlowLayout = UICollectionViewFlowLayout()
        masterProductsCollectionFlowLayout?.scrollDirection = .vertical
        masterProductsCollectionFlowLayout?.minimumLineSpacing = 1
        masterProductsCollectionFlowLayout?.minimumInteritemSpacing = 1
        
        masterBrandCollectionFlowLayout = UICollectionViewFlowLayout()
        masterBrandCollectionFlowLayout?.scrollDirection = .vertical
        masterBrandCollectionFlowLayout?.minimumLineSpacing = 1
        masterBrandCollectionFlowLayout?.minimumInteritemSpacing = 1
        
        let collectionViewFrame = CGRect(x: 1.0, y: 1.0, width: view.bounds.size.width - 42.0 , height: 129.0)
        masterProductsCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: masterProductsCollectionFlowLayout!)
        masterProductsCollectionView?.showsVerticalScrollIndicator = false
        masterProductsCollectionView?.showsHorizontalScrollIndicator = false
        masterProductsCollectionView?.dataSource = self
        masterProductsCollectionView?.delegate = self
        masterProductsCollectionView?.isPagingEnabled = true
        masterProductsCollectionView?.register(BrandProductCell.self, forCellWithReuseIdentifier: identifierForProduct)
        masterProductsCollectionView?.backgroundColor = UIColor.lightGray
        
        
//        主打品牌
        let collectionBrandViewFrame = CGRect(x: 1.0, y: 1.0, width: view.bounds.size.width - 42.0 , height: 129.0)
        masterBrandCollectionView = UICollectionView(frame: collectionBrandViewFrame, collectionViewLayout: masterBrandCollectionFlowLayout!)
        masterBrandCollectionView?.showsVerticalScrollIndicator = false
        masterBrandCollectionView?.showsHorizontalScrollIndicator = false
        masterBrandCollectionView?.dataSource = self
        masterBrandCollectionView?.delegate = self
        masterBrandCollectionView?.isPagingEnabled = true
        masterBrandCollectionView?.register(BrandProductCell.self, forCellWithReuseIdentifier: identifierForBrand)
        masterBrandCollectionView?.backgroundColor = UIColor.lightGray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return indexOfList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else{
           return 5
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexOfList
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "hotProductCell", for: indexPath)
            let productView = cell?.viewWithTag(2)
            productView?.addSubview(masterProductsCollectionView!)
            
        }else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "hotBrandCell", for: indexPath)
            let brandView = cell?.viewWithTag(2)
            brandView?.addSubview(masterBrandCollectionView!)
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath)
        }
        return cell!
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
           return 180.0
        }else if indexPath.section == 1 {
            return 180.0
        }else{
            return 60.0
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }else{
            return 15.0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 || section == 1 {
            return nil
        }else{
            return indexOfList[section]
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

extension FindTableViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.bounds.size.width / 5.0) - 1.0 , height: 64.0)
    }
}
extension FindTableViewController : UICollectionViewDelegate{

}
extension FindTableViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell : UICollectionViewCell?
        if collectionView == masterProductsCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierForProduct, for: indexPath)
            if let tCell = cell as? BrandProductCell {
                tCell.iconImage = UIImage(named: "home")
                tCell.itemName = "aaaaa"
                tCell.backgroundColor = UIColor.white
            }
            cell?.backgroundColor = UIColor.white
        }
        else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierForBrand, for: indexPath)
            if let tCell = cell as? BrandProductCell{
                tCell.iconImage = UIImage(named: "home")
                tCell.itemName = "aaaaa"
            }
            cell?.backgroundColor = UIColor.white
        }

        return cell!
    }
    
}

