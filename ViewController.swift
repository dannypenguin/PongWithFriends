//
//  ViewController.swift
//  PongWithFriends
//
//  Created by Danny Peng on 2/11/17.
//  Copyright © 2017 Danny Peng. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var player2Name: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Prepares and data that will be passed into the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destView: GameScene = segue.destination as! GameScene
        destView.LabelText = "VS: " + player2Name.text!
    }


}

