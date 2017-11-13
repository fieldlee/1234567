//
//  homeViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/21.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
//    lazy var preLanuchTime : String? = {
//        let defaults = UserDefaults.standard
//        let token = defaults.value(forKey: Key_Lanuch_Time) as! String?
//        return token
//    }()

    @IBOutlet weak var AddBtnItem: UIBarButtonItem!
    @IBOutlet weak var HomeTable: UITableView!
    var headCollectionView : UICollectionView?
    var headCollectionLayout : UICollectionViewFlowLayout?
    var headControl : UIPageControl?
    let headCollectionIdentifier = "headReuseId"
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTable.delegate = self
        HomeTable.dataSource = self
        HomeTable.tableFooterView = UIView()
        HomeTable.backgroundColor = borderColor
        
        // Do any additional setup after loading the view.
        headCollectionLayout = UICollectionViewFlowLayout()
        headCollectionLayout?.scrollDirection = .horizontal
        headCollectionLayout?.minimumLineSpacing = 0

        let collectionViewFrame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: 200.0)
        headCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: headCollectionLayout!)
        headCollectionView?.showsVerticalScrollIndicator = false
        headCollectionView?.showsHorizontalScrollIndicator = false
        headCollectionView?.dataSource = self
        headCollectionView?.delegate = self
        headCollectionView?.isPagingEnabled = true
        headCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: headCollectionIdentifier)
        headCollectionView?.backgroundColor = borderColor
        
        let headControlFrame = CGRect(x: 80.0, y: 200.0 - 30.0, width: view.bounds.size.width - 160.0, height: 30.0)
        headControl = UIPageControl(frame: headControlFrame)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dateTimeInterval = NSDate().timeIntervalSince1970
        let defaults = UserDefaults.standard
        let preLanuchTime = defaults.value(forKey: Key_Lanuch_Time) as! String?
        if let preTime = preLanuchTime {
            if (dateTimeInterval - NSNumber(value: preTime.floatValue).doubleValue) >= 60 * 60 * 24{
                presentLanuchView()
            }
        }else{
            presentLanuchView()
            
        }
    }
//    MARK : - click
    
    @IBAction func rightClick(_ sender: Any) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentLanuchView()  {
        let dateTimeInterval = NSDate().timeIntervalSince1970
        let defaults = UserDefaults.standard
        defaults.setValue("\(dateTimeInterval)", forKey: Key_Lanuch_Time)
        defaults.synchronize()
        
        let lanchView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lanuchView")
        self.navigationController?.present(lanchView, animated: true, completion: nil)
    }
    
// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
extension homeViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.bounds.size.width, height: 200.0)
    }
}
extension homeViewController : UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / view.frame.size.width)
        
        let count = 5

        headControl?.currentPage = page
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension homeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headCollectionIdentifier, for: indexPath)
        let imageFrame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200.0)
        let imageForCell = UIImageView(frame: imageFrame)
        imageForCell.image = UIImage(named: "bannerpic")
        cell.addSubview(imageForCell)
        return cell
    }
    
}

extension homeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
    }
}
extension homeViewController : UITableViewDataSource{
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200.0))
//        headView.addSubview(headCollectionView!)
//        return headView
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell?
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "headCell", for: indexPath)
            cell?.addSubview(headCollectionView!)
            headControl?.currentPage = 0
            headControl?.numberOfPages = 5
            cell?.addSubview(headControl!)
        }
        else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "noTitleCell", for: indexPath)
        }else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "oneImageCell", for: indexPath)

        }else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "threeImagesCell", for: indexPath)
        }else {
           cell = tableView.dequeueReusableCell(withIdentifier: "bigVideoCell", for: indexPath)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
           return 200.0
        }
        else if indexPath.row == 1 {
            return 70.0
        }else if indexPath.row == 2 {
            return 70.0
            
        }else if indexPath.row == 3 {
            return 150.0
        }else {
           return 170.0
        }
    }
}
