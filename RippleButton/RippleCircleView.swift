//
//  RippleView.swift
//  RippleButton
//
//  Created by Swaying on 2017/9/14.
//  Copyright © 2017年 xhey. All rights reserved.
//

import UIKit


class RippleCircleView: UIView {
    
    var minimumRadius: CGFloat
    var maxRadius: CGFloat
    var centerCircleColor: UIColor = UIColor.white {
        didSet {
            centerCircleView?.circleColor = centerCircleColor
        }
    }
    var centerCirCleSize: CGFloat {
        didSet {
            let circleX: CGFloat = (width - centerCirCleSize) * 0.5
            let circleY: CGFloat = (height - centerCirCleSize) * 0.5
            centerCircleView?.frame = CGRect(x: circleX, y: circleY, width: centerCirCleSize, height: centerCirCleSize)
        }
    }
    var radius: CGFloat {
        set {
            var value = newValue < minimumRadius ? minimumRadius : newValue
            let minSize = width < height ? width : height
            value = value > minSize/2 ? minSize/2 : value
            _radius = value
            updateRadius(_radius)
        }
        get {
            return _radius
        }
    }
    private var _radius: CGFloat = 50
    private var blurView: UIVisualEffectView?
    private var maskLayer: CAShapeLayer?
    private var centerCircleView: CircleView?
    
    override init(frame: CGRect) {
        
        
        let minWidthOrHeight: CGFloat = frame.width < frame.height ? frame.width : frame.height
        centerCirCleSize = minWidthOrHeight * 0.3
        
        maxRadius = frame.width * 0.5
        minimumRadius = centerCirCleSize * 0.5
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("RippleView -- deinit")
    }
    
    private func setupUI() {
        
        let blur: UIBlurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blur)
        blurView?.frame = bounds
        addSubview(blurView!)
        
        maskLayer = CAShapeLayer()
        maskLayer?.fillColor = UIColor.white.cgColor
        let centerPoint: CGPoint = CGPoint(x: width/2, y: height/2)
        let path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        maskLayer?.path = path.cgPath

        blurView?.layer.mask = maskLayer
        centerCircleView = CircleView(circleColor: centerCircleColor)
        let circleX: CGFloat = (width - centerCirCleSize) * 0.5
        let circleY: CGFloat = (height - centerCirCleSize) * 0.5
        centerCircleView?.frame = CGRect(x: circleX, y: circleY, width: centerCirCleSize, height: centerCirCleSize)
        addSubview(centerCircleView!)
    }
    
    private func updateRadius(_ radius: CGFloat) {
        let centerPoint: CGPoint = CGPoint(x: width/2, y: height/2)
        let path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        maskLayer?.path = path
    }
    
}

class CircleView: UIView {
    
    var circleColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    init(circleColor color: UIColor) {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("CircleView -- deinit")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let centerPoint: CGPoint = CGPoint(x: rect.width/2, y: rect.height/2)
        let minWidthOrHeight: CGFloat = rect.width < rect.height ? rect.width : rect.height

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.addArc(center: centerPoint, radius: minWidthOrHeight/2, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        context.setFillColor(circleColor.cgColor)
        context.fillPath()
    }
}
