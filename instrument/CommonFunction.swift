//
//  CommonFunction.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/24.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class CommonFunction: NSObject {
    class func getTimeStamp(key: String) -> String {
        var timeStampString = "0"
        
        let defaults = UserDefaults.standard
        if let timestamp = defaults.string(forKey: key) {
            timeStampString = timestamp
        }
        
        return timeStampString
    }
    class func updateTimeStamp(key: String,
                               timeStamp: String) {
        
        let defaults = UserDefaults.standard
        defaults.set(timeStamp, forKey: key)
        defaults.synchronize()
    }
    class func presentAlertForClear(viewController:UIViewController,block:@escaping ()->()){
        let alert = UIAlertController(title: "提示", message: NSLocalizedString("你确实想要清空缓存吗?", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("确定", comment: ""), style: UIAlertActionStyle.default, handler: { (action) -> Void in
            block()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("取消", comment: ""), style: UIAlertActionStyle.cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }

    
}
