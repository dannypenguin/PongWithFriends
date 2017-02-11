//
//  ViewController.swift
//  PongWithFriends
//
//  Created by Danny Peng on 2/11/17.
//  Copyright © 2017 Danny Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Prepares and data that will be passed into the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destView: GameScene = segue.destination as! GameScene
        destView.LabelText = player2Name.text!
    }


}

