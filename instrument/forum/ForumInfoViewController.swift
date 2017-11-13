//
//  ForumInfoViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/29.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit
import AASegmentedControl

class ForumInfoViewController: UIViewController {
    var pageViewController: UIPageViewController!
    var controllers = [UIViewController]()
    var detailView : ForumDetailViewController?
    var commentsView : ForumCommentsViewController?
    

    @IBOutlet weak var btnComment: MIBadgeButton!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnCollect: UIButton!
    var titleSeg : AASegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.childViewControllers.first as! UIPageViewController
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let segTitleRect = CGRect(x: 0, y: 0, width: 200, height: 40.0)
        titleSeg = AASegmentedControl(frame: segTitleRect)
        titleSeg.itemNames = ["内容","跟帖"]
        titleSeg.activeColor = UIColor.white
        titleSeg.activeUnderline = true
        titleSeg.backgroundColor = UIColor.clear
        titleSeg.borderColor = UIColor.clear
        titleSeg.font = ColorUtility.Helvetica17()
        titleSeg.selectedIndex = 0
        titleSeg.addTarget(self, action: #selector(ForumInfoViewController.segChange), for: .valueChanged)
        navigationItem.titleView = titleSeg
        
        
        detailView = storyboard?.instantiateViewController(withIdentifier: "ForumDetailView") as? ForumDetailViewController
        commentsView = storyboard?.instantiateViewController(withIdentifier: "ForumCommentsView") as? ForumCommentsViewController
        
        pageViewController.setViewControllers([detailView!], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segChange()  {
        if titleSeg.selectedIndex == 0 {
            pageViewController.setViewControllers([detailView!], direction: .forward, animated: true) { (b) in
                
            }
        }else{
            pageViewController.setViewControllers([commentsView!], direction: .forward, animated: true) { (b) in
                
            }
        }
    }
    
    @IBAction func comment(_ sender: Any) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func share(_ sender: Any) {
        let wechatimage = UIImage(named: "wechat")
        let weiboimage = UIImage(named: "weibo")
        let twitterimage = UIImage(named: "twitter")
        let imagesList = [wechatimage,weiboimage,twitterimage]
        
        SGActionView.showGridMenu(withTitle: "share", itemTitles: ["微信","微博","Twitter"], images: imagesList) { (selectInt) in
            print(selectInt)
        }
    }
    @IBAction func showComment(_ sender: Any) {
        pageViewController.setViewControllers([commentsView!], direction: .forward, animated: true) { (b) in
            
        }
    }

    @IBAction func collect(_ sender: Any) {
    }
}

extension ForumInfoViewController : UIPageViewControllerDelegate{
    
}
extension ForumInfoViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if viewController.isKind(of: ForumCommentsViewController.self) {
            titleSeg.selectedIndex = 0
            return detailView
        }
        return nil
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if viewController.isKind(of: ForumDetailViewController.self) {
            titleSeg.selectedIndex = 1
            return commentsView
        }
        return nil
    }
}
