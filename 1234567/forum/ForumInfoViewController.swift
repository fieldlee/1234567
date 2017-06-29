//
//  ForumInfoViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/29.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class ForumInfoViewController: UIViewController {
    var pageViewController: UIPageViewController!
    var controllers = [UIViewController]()
    var detailView : ForumDetailViewController?
    var commentsView : ForumCommentsViewController?
    @IBOutlet weak var btnComment: UIButton!
    
    @IBOutlet weak var btnCollect: UIButton!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnShowComment: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.childViewControllers.first as! UIPageViewController
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        detailView = storyboard?.instantiateViewController(withIdentifier: "ForumDetailView") as? ForumDetailViewController
        commentsView = storyboard?.instantiateViewController(withIdentifier: "ForumCommentsView") as? ForumCommentsViewController
        
        pageViewController.setViewControllers([detailView!], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}

extension ForumInfoViewController : UIPageViewControllerDelegate{
    
}
extension ForumInfoViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if viewController.isKind(of: ForumCommentsViewController.self) {
            return detailView
        }
        return nil
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if viewController.isKind(of: ForumDetailViewController.self) {
            return commentsView
        }
        return nil
    }
}
