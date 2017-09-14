//
//  ViewController.swift
//  RippleButton
//
//  Created by Swaying on 2017/9/14.
//  Copyright © 2017年 xhey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var v: RippleView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        v = RippleView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        v?.backgroundColor = UIColor.blue
        view.addSubview(v!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        v?.s += 1
        v?.setNeedsDisplay()
    }
}

