//
//  ImpressView.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/24.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ImpressView: UIView {
    var target : UIViewController?
    var impressArr = [Any]()
    let separation :CGFloat = 5.0
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let heigth = rect.size.height
        let width = rect.size.width
        var x : CGFloat = 0.0
        var rowNum :CGFloat = 0.0
        var colNum : CGFloat = 0.0
        for impressObject in impressArr {
            let tBtn = UIButton()
            var tLabelFrame = CGRect(x: 0, y: 0 , width: 100, height: 30.0)
            if let impressDic =  impressObject as? Dictionary<String, Any> {
                if let titlestring =  impressDic["name"] as? String {
                    let tSize = titlestring.size(attributes: [NSFontAttributeName: ColorUtility.Helvetica15()])
                    let stringWidth =  tSize.width + 25.0
                    tLabelFrame.size.width = stringWidth - 5.0
                    tBtn.setTitle(titlestring, for: .normal)
                    
                    x = x + stringWidth
                    
                    if x > width{
                        rowNum = rowNum + 1.0
                        
                        tLabelFrame.origin.y = (30.0)*rowNum + (separation * rowNum)
                        tLabelFrame.origin.x = 0.0
                        x =  stringWidth
                    }else{
                        colNum =  colNum + 1.0
                        tLabelFrame.origin.y = (30.0)*rowNum + (separation * rowNum)
                        tLabelFrame.origin.x = (x - stringWidth)
                    }
                    if tLabelFrame.origin.y + 30.0 > heigth {
                        continue
                    }
                }
                if let lvlstring =  impressDic["level"] as? String {
                    if lvlstring == "best" {
                        tBtn.backgroundColor = UIColor.white
                        tBtn.setTitleColor(mainColor, for: .normal)
                        tBtn.titleLabel?.font = ColorUtility.Helvetica15()
                        tBtn.layer.borderColor = mainColor.cgColor
                    }else{
                        tBtn.backgroundColor = UIColor.white
                        tBtn.titleLabel?.font = ColorUtility.Helvetica15()
                        tBtn.setTitleColor(UIColor.black, for: .normal)
                        tBtn.layer.borderColor = UIColor.black.cgColor
                    }
                    tBtn.layer.cornerRadius = 15.0
                    tBtn.layer.masksToBounds = true
                    tBtn.layer.borderWidth = 0.5
                }
            }
            tBtn.frame = tLabelFrame
            tBtn.addTarget(target, action: #selector(ImpressView.impressClick), for: .touchUpInside)
            self.addSubview(tBtn)
        }
        
    }
    
    func impressClick(sender:Any)  {
        
    }

}
