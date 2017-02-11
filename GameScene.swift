//
//  GameScene.swift
//  PongWithFriends
//
//  Created by Danny Peng on 2/11/17.
//  Copyright © 2017 Danny Peng. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import CoreMotion

class GameScene: ViewController {
    
    @IBOutlet weak var typeOfPassLabel: UILabel!
    
    @IBOutlet weak var PassName: UILabel!
    
    @IBOutlet weak var hitScheme: UIView!
    
    var LabelText = String()
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()

        typeOfPassLabel.text = "Excellent!"
        hitScheme.backgroundColor = .magenta
        PassName.text = LabelText
        
//        motionManager = CMMotionManager()
//        motionManager.startAccelerometerUpdates()
        
//        while true{
//        recordChange()
//        }
    }
    
    func recordChange(){
        if motionManager.accelerometerData != nil {
        var accelX: Double = (motionManager.accelerometerData?.acceleration.x)!
            print(accelX)
        }
    }
    
}
