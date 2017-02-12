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
    lazy var motionManager = CMMotionManager()
    var lastupdated: NSDate = NSDate(timeIntervalSinceReferenceDate: 0)
    var lastX: Float = 0
    var lastY: Float = 0
    var lastZ: Float = 0
    var changeinVar = Float()
    var grabFlag: Bool = true
    var hasSwung: Bool = false
    let shakeThreshold: Float = 2
    var recurseFlag: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //motionManager.startAccelerometerUpdates()
        recordChange()
        
        typeOfPassLabel.text = "Welcome!"
        hitScheme.backgroundColor = .green
        PassName.text = LabelText


        
    }
    

    func thresholdCipher(value: Float) {
        if value >= 13 {
            self.typeOfPassLabel.text = "Excellent!"
            self.hitScheme.backgroundColor = .magenta
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        } else if value > 9 && value <= 12 {
            self.typeOfPassLabel.text = "Wow!"
            self.hitScheme.backgroundColor = .red
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        } else {
            self.typeOfPassLabel.text = "Nice!"
            self.hitScheme.backgroundColor = .blue
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    func recordChange(){
        DispatchQueue.global(qos: .background).async {
            while self.grabFlag == true {
                let start: NSDate = NSDate()
                var cont = start.timeIntervalSince(self.lastupdated as Date)
                self.motionManager.startAccelerometerUpdates()
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
                        
                        if accel != 0 && accel > 7 {
                            DispatchQueue.main.async {
                                self.thresholdCipher(value: accel)
                                //self.grabFlag = false
                                self.motionManager.stopAccelerometerUpdates()
                            }
                        }
                    }
                }
                
            }
            //self.motionManager.stopAccelerometerUpdates()
            print("Reached")
        }
    }
}
