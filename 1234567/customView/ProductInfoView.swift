//
//  ProductInfoView.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/29.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ProductInfoView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
//        image label
        let ImgLabFrame = CGRect(x: 20, y: 100, width: 200, height: 20)
        let imagesLabel = UILabel(frame: ImgLabFrame)
        imagesLabel.font = ColorUtility.Helvetica11()
        imagesLabel.text = "900 张图片"
        imagesLabel.textAlignment = .left
        imagesLabel.textColor = UIColor.white
        
        let nameFrame = CGRect(x: 20, y: 125, width: 200, height: 25)
        let nameLabel = UILabel(frame: nameFrame)
        nameLabel.font = ColorUtility.Helvetica17()
        nameLabel.text = "斯坦福"
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.white
        
//        price
        let priceFrame = CGRect(x: 20, y: 160, width: 200, height: 20)
        let priceLabel = UILabel(frame: priceFrame)
        priceLabel.font = ColorUtility.Helvetica13()
        priceLabel.text = "厂商指导价格 1.3 W"
        priceLabel.textAlignment = .left
        priceLabel.textColor = UIColor.white
        
        self.addSubview(imagesLabel)
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
    }
    

}
