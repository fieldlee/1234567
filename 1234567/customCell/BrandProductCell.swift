//
//  BrandProductCell.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/22.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class BrandProductCell: UICollectionViewCell {
    var iconImage : UIImage?
    var itemName : String?
    override func draw(_ rect: CGRect) {
        let  iconImageFrame = CGRect(x: 15, y: 5, width: rect.width - 30, height: rect.height - 25)
        let iconImageView = UIImageView(frame: iconImageFrame)
        iconImageView.image = iconImage
        self.addSubview(iconImageView)
        
        let cellFrame = CGRect(x: 0, y: rect.height - 20, width: rect.width, height: 20)
        let cellLabel = UILabel(frame: cellFrame)
        cellLabel.text = itemName
        cellLabel.font = UIFont(name: "Arial", size: 13.0)
        cellLabel.textAlignment = .center
        self.addSubview(cellLabel)
    }
}
