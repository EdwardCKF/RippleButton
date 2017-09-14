//
//  RippleView.swift
//  RippleButton
//
//  Created by Swaying on 2017/9/14.
//  Copyright © 2017年 xhey. All rights reserved.
//

import UIKit

class RippleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    
    var s: CGFloat = 50
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let frame = CGRect(x: 10, y: 10, width: s, height: s)

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.addEllipse(in: frame)
        context.setFillColor(UIColor.red.cgColor)
        
        context.fillPath()
    }

}
