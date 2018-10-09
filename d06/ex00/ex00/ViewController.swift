//
//  ViewController.swift
//  ex00
//
//  Created by Kyle ROUTLEDGE on 2018/10/09.
//  Copyright © 2018 Kyle ROUTLEDGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapGesture: UITapGestureRecognizer!
    var dynamicAnimator: UIDynamicAnimator!
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    let elastic = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(tapGesture)
        self.view.backgroundColor = UIColor.lightGray
        
        gravity.magnitude = 7
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(collider)
        dynamicAnimator.addBehavior(elastic)
        elastic.elasticity = 0.7
        collider.translatesReferenceBoundsIntoBoundary = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapRecognizer(_ sender: UITapGestureRecognizer) {
        let location = tapGesture.location(in: view)
        let shape = Shapes(frame: CGRect(x: location.x, y:location.y, width:100, height:100))
        self.view.addSubview(shape)
        
        collider.addItem(shape)
        gravity.addItem(shape)
        elastic.addItem(shape)
    }
}

