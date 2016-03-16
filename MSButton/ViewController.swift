//
//  ViewController.swift
//  MSButton
//
//  Created by SinObjectC on 16/3/15.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  申明自定义缩放动画按钮
    var mButton: MSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightTextColor()
        
        // 实例化自定义按钮
        self.mButton = MSButton(frame: CGRect(x: 80, y: 150, width: 150, height: 50), title: "方角缩放按钮", color: UIColor.brownColor(), scale: nil, cornerRadius: nil, block: { () -> Void in
            print("方角按钮事件")
        })
        
        // 实例化自定义按钮圆角
        let mButtonRadius = MSButton(frame: CGRect(x: 80, y: 250, width: 150, height: 50), title: "圆角缩放按钮", color: UIColor.orangeColor(), scale: nil, cornerRadius: 10) { () -> Void in
            self.say()
        }
        
        self.view.addSubview(self.mButton)
        self.view.addSubview(mButtonRadius)
    }
    
    /** 事件测试 */
    func say() {
        print("圆角按钮事件")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

