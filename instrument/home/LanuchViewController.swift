//
//  LanuchViewController.swift
//  1234567
//
//  Created by De Peng Li on 2017/6/23.
//  Copyright © 2017年 De Peng Li. All rights reserved.
//

import UIKit

class LanuchViewController: UIViewController {

    @IBOutlet weak var jumpBtn: UIButton!
    var timer : Timer?
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
        self.jumpBtn.backgroundColor = litColor
        self.jumpBtn.layer.cornerRadius = 15.0
        
        
        let Timers = Timer(timeInterval: 1.0, target: self, selector: #selector(LanuchViewController.dissmiss), userInfo: nil, repeats:true)
        RunLoop.main.add(Timers, forMode: RunLoopMode.commonModes)
        timer = Timers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dissmiss()  {
        num = num + 1
        if num >= 5{
          self.dismiss(animated: false, completion: nil)
        }else{
           self.jumpBtn.setTitle("\(5-num) 跳过页面", for: .normal)
        }
    }
    
    @IBAction func jumpClick(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let _ = timer {
            timer!.invalidate()
        }
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
