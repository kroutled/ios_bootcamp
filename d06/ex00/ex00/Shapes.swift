//
//  Shapes.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/09.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class Shapes: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame.offsetBy(dx: (frame.width/2) * -1, dy: (frame.height/2) * -1))
        backgroundColor = getRandomColor()
        let randomNumber = arc4random_uniform(20)
        if randomNumber >= 10
        {
            layer.cornerRadius = frame.height/2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func getRandomColor() -> UIColor
    {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green:green, blue:blue, alpha: 1.0)
    }
}
