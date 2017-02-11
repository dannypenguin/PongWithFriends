//
//  GameScene.swift
//  PongWithFriends
//
//  Created by Danny Peng on 2/11/17.
//  Copyright © 2017 Danny Peng. All rights reserved.
//

import Foundation
import UIKit

class GameScene: ViewController {
    
    @IBOutlet weak var typeOfPassLabel: UILabel!
    
    @IBOutlet weak var PassName: UILabel!
    
    @IBOutlet weak var hitScheme: UIView!
    
    var LabelText = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        typeOfPassLabel.text = "Excellent!"
        hitScheme.backgroundColor = .red 
        PassName.text = LabelText
    }
}
