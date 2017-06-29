//
//  HotCollectionViewCell.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/24.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class HotCollectionViewCell: UICollectionViewCell {
    var productImage : UIImage?
    var productName : String?
    override func draw(_ rect: CGRect) {
        let  iconImageFrame = CGRect(x: 10, y: 10, width: rect.width - 20, height: rect.height - 35)
        let iconImageView = UIImageView(frame: iconImageFrame)
        iconImageView.image = productImage
        self.addSubview(iconImageView)
        
        let cellFrame = CGRect(x: 0, y: rect.height - 30, width: rect.width, height: 30)
        let cellLabel = UILabel(frame: cellFrame)
        cellLabel.text = productName
        cellLabel.font = ColorUtility.Helvetica15()
        cellLabel.textAlignment = .center
        self.addSubview(cellLabel)
    }
}
