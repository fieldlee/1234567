//
//  BrandInfoViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/23.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class BrandInfoViewController: UIViewController {

    @IBOutlet weak var infoTableView: UITableView!
    var headCollectionView : UICollectionView?
    var headCollectionLayout : UICollectionViewFlowLayout?
    var titleName : String?
    let brandInfoText = "商户在国付宝网站注册企业用户，并收取系统邮件进行激活."
    var tempTextView = UITextView()
    var textviewCellHeight :CGFloat = 0.0
//商户以邮寄、传真等方式将营业执照等复印件送国付宝运营平台审核，审核通过后商户可使用注册的email地址作为用户名登录国付宝。	登录后首先开通企业结算虚拟帐户并设置支付密码。点击页面右上角的 开通商户服务 链接，并输入真实有效的商户申请信息，提交后等待国付宝运营人员审核。 	审核通过后请退出并重新登录商户企业用户，开通商户服务的企业用户将新增（商城商铺服务）功能，并在安全中心功能中增加 设置商户识别码 功能，商户自行输入识别码后即可生效。关于识别码详见关于商户识别码。
    let headCollectionIdentifier = "headReuseId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleName
        
        infoTableView.delegate = self
        infoTableView.dataSource = self

        infoTableView.tableFooterView = UIView()
        
        tempTextView.frame =  CGRect(x: 0, y: 0, width: view.bounds.size.width - 40.0 , height: 999.0)
        tempTextView.text = brandInfoText
        textviewCellHeight = tempTextView.contentSize.height
        
        headCollectionLayout = UICollectionViewFlowLayout()
        headCollectionLayout?.scrollDirection = .horizontal
        headCollectionLayout?.minimumLineSpacing = 10
        
        let collectionViewFrame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width - 40.0, height: 100.0)
        headCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: headCollectionLayout!)
        headCollectionView?.showsVerticalScrollIndicator = false
        headCollectionView?.showsHorizontalScrollIndicator = false
        headCollectionView?.dataSource = self
        headCollectionView?.delegate = self
        headCollectionView?.isPagingEnabled = true
        headCollectionView?.register(HotCollectionViewCell.self, forCellWithReuseIdentifier: headCollectionIdentifier)
        headCollectionView?.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension BrandInfoViewController : UITableViewDelegate
{
    
}
extension BrandInfoViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0  {
            return 15.0
        }
        return 0.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "brandTitleCell", for: indexPath)
            }else{
                cell = tableView.dequeueReusableCell(withIdentifier: "brandInfoCell", for: indexPath)
                let textinfoView = cell?.viewWithTag(1) as! UITextView
                textinfoView.text = brandInfoText
                print(textinfoView.contentSize)
            }
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "hotProductsCell", for: indexPath)
            let hotProductView = cell?.viewWithTag(1)
            hotProductView?.addSubview(headCollectionView!)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 44.0
            }else{
                
                
                
               return textviewCellHeight + 50 + 8.5
            }
        }else{
           return 130.0
        }
    }
}

extension BrandInfoViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (view.bounds.size.width - 40.0) / 4.0, height: 100.0)
    }
}
extension BrandInfoViewController : UICollectionViewDelegate{

}
extension BrandInfoViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headCollectionIdentifier, for: indexPath)
        if let tCell = cell as? HotCollectionViewCell {
            tCell.productName = "12345678"
            tCell.productImage = UIImage(named: "bannerpic")
            tCell.backgroundColor = UIColor.white
        }
        return cell
    }
    
}
