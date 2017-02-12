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
import AudioToolbox

class GameScene: ViewController {
    
    @IBOutlet weak var typeOfPassLabel: UILabel!
    
    @IBOutlet weak var PassName: UILabel!
    
    @IBOutlet weak var hitScheme: UIView!
    
    var LabelText = String()
    var motionManager: CMMotionManager!
    var lastupdated: NSDate = NSDate(timeIntervalSinceReferenceDate: 0)
    var lastX: Float = 0
    var lastY: Float = 0
    var lastZ: Float = 0
    var changeinVar = Float()
    var grabFlag: Bool = true
    var hasSwung: Bool = false
    let shakeThreshold: Float = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()

        typeOfPassLabel.text = "Excellent!"
        hitScheme.backgroundColor = .magenta
        PassName.text = LabelText
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        
        self.recordChange()
    }
    func thresholdCipher(value: Float) {
        if value <= 7 {
            self.typeOfPassLabel.text = ""
        }
    }
    
    func recordChange(){
        DispatchQueue.global(qos: .background).async {
            while self.grabFlag == true {
                let start: NSDate = NSDate()
                var cont = start.timeIntervalSince(self.lastupdated as Date)
                if self.motionManager.accelerometerData != nil {
                    var accelX: Float = Float((self.motionManager.accelerometerData?.acceleration.x)!)
                    var accelY: Float = Float((self.motionManager.accelerometerData?.acceleration.y)!)
                    var accelZ: Float = Float((self.motionManager.accelerometerData?.acceleration.z)!)
                    if cont > 0.1 {
                        self.lastupdated = NSDate()
                        var velocity: Float = abs(accelX + accelY + accelZ - self.lastX - self.lastY - self.lastZ)
                        var accel: Float = velocity/Float(cont)
                        self.lastX = accelX
                        self.lastY = accelY
                        self.lastZ = accelZ
                        self.changeinVar = velocity
                        
                        if accel != 0 {
                            DispatchQueue.main.async {
                                self.typeOfPassLabel.text = String(accel)
                            }
                            if accel > 9 {
                                self.hasSwung = true
                                self.grabFlag = false
//                                print(self.hasSwung)
                            }
                        
                        }
                        
                    }
                }
            }
        }
    }
}
