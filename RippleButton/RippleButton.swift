//
//  RippleButton.swift
//  RippleButton
//
//  Created by Swaying on 2017/9/14.
//  Copyright © 2017年 xhey. All rights reserved.
//

import UIKit

class RippleButton: UIButton {
    
    var hightlightColor: UIColor = UIColor.clear
    var circleRait: CGFloat = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        
    }

}
