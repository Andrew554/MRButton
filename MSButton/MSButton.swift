//
//  MSButton.swift
//  MSButton
//
//  Created by SinObjectC on 16/3/15.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

/** MARK: 自定义的点击缩放按钮控件 */

class MSButton: UIButton {
    
    // 闭包属性：按钮点击事件处理
    internal var block: (()-> Void)?
    // 按钮缩放比例
    internal var buttonScale: CGFloat?
    // 按钮默认缩放比例
    private let defaultScale: CGFloat = 0.85
    // 按钮缩放动画事件
    private let animationTime: NSTimeInterval = 0.25
    
    // 构造器方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type buttonType: UIButtonType) {
        self.init(frame: CGRectZero)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 按下时
        self.addTarget(self, action: "pressedEvent:", forControlEvents: .TouchDown)
        // 松手后
        self.addTarget(self, action: "unpressedEvent:", forControlEvents: [UIControlEvents.TouchUpInside, .TouchDragInside])
    }
    
    /** 缩放按钮便利构造器 */
    convenience init(frame: CGRect, title: String, color: UIColor, scale: CGFloat?, cornerRadius: CGFloat?, block: (() -> Void)?){
        self.init(frame: frame)
        self.setTitle(title, forState: .Normal)
        self.backgroundColor = color
        self.block = block
        
        // 是否自定义缩放比例
        if scale != nil {
            self.buttonScale = scale
        }
        
        // 按钮是否设置为圆角
        if cornerRadius != nil {
            self.layer.cornerRadius = cornerRadius!
        }
        
    }
    
    /** MARK: 按下按钮事件 */
    func pressedEvent(btn: MSButton) {
        // 缩放比例必须大于0，而且小于等于1，默认缩放比例为0.9
        let scale: CGFloat! = ((buttonScale != nil) && buttonScale <= 1.0) ? buttonScale : defaultScale
        
        UIView.animateWithDuration(animationTime) { () -> Void in
            btn.transform = CGAffineTransformMakeScale(scale, scale)
        }
    }
    
    /** MARK: 松开按钮事件 */
    func unpressedEvent(btn: MSButton) {
        UIView.animateWithDuration(animationTime, animations: { () -> Void in
            btn.transform = CGAffineTransformIdentity
            }) { (finish) -> Void in
                // 执行动作响应
                if let _block = self.block {
                    _block()
                }
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
