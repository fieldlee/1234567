//
//  ProductNavigationBar.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/29.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ProductNavigationBar: UIView {
    var target : UIViewController?
    var  backBtn : UIButton?
    override func draw(_ rect: CGRect) {
        
        let navBarWidth = rect.size.width
        self.backgroundColor = UIColor.clear
//        返回
        let backFrame = CGRect(x: 15.0, y: 25.0, width: 25.0, height: 35.0)
        backBtn = UIButton(frame: backFrame)
        let backImage = UIImage(named: "返回")
        backBtn?.setImage(backImage, for: .normal)
        backBtn?.addTarget(target, action: #selector(ProductNavigationBar.backToPre), for: .touchUpInside)
        self.addSubview(backBtn!)
//        收藏
        let collectFrame = CGRect(x: navBarWidth / 2, y: 25.0, width: 40.0, height: 40.0)
        let collectBtn = UIButton(frame: collectFrame)
        let collectImage = UIImage(named: "分享收起")
        collectBtn.setImage(collectImage, for: .normal)
        collectBtn.addTarget(target, action: #selector(ProductNavigationBar.collect), for: .touchUpInside)
        self.addSubview(collectBtn)
//        PK
        let PKFrame = CGRect(x: navBarWidth / 2 + (navBarWidth/6), y: 25.0, width: 40.0, height: 40.0)
        let PKBtn = UIButton(frame: PKFrame)
        let PKImage = UIImage(named: "分享收起")
        PKBtn.setImage(PKImage, for: .normal)
        PKBtn.addTarget(target, action: #selector(ProductNavigationBar.addPk), for: .touchUpInside)
        self.addSubview(PKBtn)
//        分享
        let ShareFrame = CGRect(x: navBarWidth / 2 + (navBarWidth/6) * 2, y: 25.0, width: 40.0, height: 40.0)
        let ShareBtn = UIButton(frame: ShareFrame)
        let ShareImage = UIImage(named: "分享收起")
        ShareBtn.setImage(ShareImage, for: .normal)
        ShareBtn.addTarget(target, action: #selector(ProductNavigationBar.share), for: .touchUpInside)
        self.addSubview(ShareBtn)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backToPre()  {
        target?.navigationController?.popViewController(animated: true)
    }
    func addPk()  {
        
    }
    func collect()  {
        
    }
    func share() {
        
    }
    func setBackImage(icon:UIImage) {
        backBtn?.setImage(icon, for: .normal)
    }
}
