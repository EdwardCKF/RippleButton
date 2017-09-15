//
//  ViewController.swift
//  RippleButton
//
//  Created by Swaying on 2017/9/14.
//  Copyright © 2017年 xhey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var v: RippleCircleView?
    var timer: Timer?
    
    var blurView: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage:UIImage(named: "aa")!)
        
        let va = RippleCircleView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view.addSubview(va)
        
        v = va
        
        var flag: Double = 10
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            flag += timer.timeInterval * 20
            if flag >= 100 {
                flag = 10
            }
            self.v?.radius = CGFloat(flag)
        })
    }
    
    func testForView() {
        
        let blur = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blur)
        blurView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        view.addSubview(blurView)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.yellow.cgColor
        blurView.layer.mask = shapeLayer
        
        let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath
        
        var time: Double = 10
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            time += (timer.timeInterval * 100)
            if time >= 100 {
                time = 0
            }
            let radius = CGFloat(time)
            
            let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            shapeLayer.path = path.cgPath
        })
    }
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        v?.centerCircleColor = UIColor.red
//        v?.centerCirCleSize += 2
//        v?.y += 10
        
//        v?.removeFromSuperview()
    }
    

}

