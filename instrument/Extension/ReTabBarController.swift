//
//  ReTabBarController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/22.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ReTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        let dic = NSDictionary(object: mainColor,forKey:NSForegroundColorAttributeName as NSCopying)
        UITabBarItem.appearance().setTitleTextAttributes(dic as? [String : AnyObject], for: UIControlState.selected)

        let items = self.tabBar.items
        for item in items! {
            switch item.tag {
            case 1:
                item.title = "首页"
                var image = UIImage(named: "home")
                image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                
                item.image = image
                var selectImage = UIImage(named: "home_selected")
                selectImage = selectImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.selectedImage = selectImage
                
                break
                
            case 2:
                item.title = "论坛"
                
                var image = UIImage(named: "gamecenter")
                image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.image = image
                
                var selectImage = UIImage(named: "game_selected")
                selectImage = selectImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.selectedImage = selectImage
                
                break
            case 3:
                
                
                item.title = "发现"
                
                var image = UIImage(named: "routes")
                image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.image = image
                
                var selectImage = UIImage(named: "routes_selected")
                selectImage = selectImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.selectedImage = selectImage
                
                break
            case 4:
                item.title = "我的"
                
                var image = UIImage(named: "personal-center")
                image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.image = image
                
                var selectImage = UIImage(named: "personal_selected")
                selectImage = selectImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
                item.selectedImage = selectImage
                break
            default: break
                
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
