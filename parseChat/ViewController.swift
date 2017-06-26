//
//  ViewController.swift
//  parseChat
//
//  Created by Alina Abidi on 6/26/17.
//  Copyright © 2017 Alina + Claire. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBAction func clickedSignUp(_ sender: UIButton) {
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        //newUser.email = emailTextField.text
        newUser.password = passwordTextField.text
        
        
        
    }
    
    
    @IBAction func clickedLogin(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

