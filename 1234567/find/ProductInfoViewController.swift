//
//  ProductInfoViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/24.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var navBackGround : UIView?
    var headBackImage : UIImageView?
    var headerInfoView : ProductInfoView?
    var navBar : ProductNavigationBar?
    let impressArr = [["name":"2017年 De Peng Li.","level":"best"],["name":"All rights reserved","level":"best"],["name":"dlkdkdkd","level":"best"],["name":"qwqwqw","level":"best"],["name":"ddddd","level":"best"],["name":"cccccc","level":"best"],["name":"sdsdasdfasdfadsfdf","level":"best"],["name":"ffffff","level":"best"],["name":"ggggg","level":"best"],["name":"hhhh","level":"best"],["name":"bb","level":"best"]]
    override func viewDidLoad() {
        super.viewDidLoad()
//        add Nav Bar
        let navFarme = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 66.0)
        navBackGround = UIView(frame: navFarme)
        navBackGround?.backgroundColor = mainColor
        navBackGround?.alpha = 0.0
        
        navBar = ProductNavigationBar(frame: navFarme)
        navBar?.target = self
        view.addSubview(navBackGround!)
        view.addSubview(navBar!)
        navBar?.backgroundColor = UIColor.clear
        navBackGround?.bringSubview(toFront: table)
        navBar?.bringSubview(toFront: navBackGround!)
//        Table
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        
        let headRect = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200.0)
        let headerView = UIView(frame:headRect )
        headBackImage = UIImageView()
        headBackImage?.image = UIImage(named: "bannerpic")
        headBackImage?.frame = headRect
        headerView.addSubview(headBackImage!)
        
        
        headerInfoView = ProductInfoView(frame: headRect)
        headerInfoView?.backgroundColor = UIColor.clear
        headerView.addSubview(headerInfoView!)
        
        table.tableHeaderView = headerView

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ProductInfoViewController : UITableViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = -(scrollView.contentOffset.y + 20.0)
        print(offsetY)
        if offsetY > CGFloat(0.0) {
            UIView.animate(withDuration: 0.0, animations: {
                self.headBackImage?.transform = CGAffineTransform(scaleX: 1 + (offsetY / 200.0) , y: 1 + (offsetY / 200.0))
                self.headBackImage?.frame.origin.y = -offsetY
                self.headerInfoView?.frame.origin.y = 0.0
            })
        }else{
            self.headBackImage?.frame.origin.y = 0.0
            self.headerInfoView?.frame.origin.y = 0.0
            
            if -(offsetY) / (200.0 - 64.0) > 1.0 {
                navBackGround?.alpha = 1.0
            }else if -(offsetY) / (200.0 - 64.0) > 0.0 {
                navBackGround?.alpha = -(offsetY) / (200.0 - 64.0)
            }else{
                navBackGround?.alpha = 0.0
            }
            
            if -(offsetY) / (200.0 - 64.0) > 0.5 {
                let backImage = UIImage(named: "返回选中")
                navBar?.setBackImage(icon: backImage!)
            }else{
                let backImage = UIImage(named: "返回")
                navBar?.setBackImage(icon: backImage!)
            }
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
    }
}
extension ProductInfoViewController : UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "impressiveCell", for: indexPath)
            let tImpressView = cell?.viewWithTag(1) as! ImpressView
            tImpressView.impressArr = self.impressArr
            tImpressView.target = self
            
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "formulaCell", for: indexPath)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150.0
        }else{
            return 60.0
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15.0
        }
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15.0
        }
        return 0.0
    }
}



extension ProductInfoViewController {
    func backToPre()  {
        navigationController?.popViewController(animated: true)
    }
    func impressClick(sender:Any)  {
        print("--")
    }
}

