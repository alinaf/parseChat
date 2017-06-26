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
    
    //Variables
    
    func showAlert(){
        let alertController = UIAlertController(title: "Error", message: "Did not enter username or password correctly.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            //handle response here
        }
        alertController.addAction(OKAction)
        present(alertController, animated: true){
            //optional code for what happens after the alert controller has finished presenting
        }
        
    }
    
    
    @IBAction func clickedSignUp(_ sender: UIButton) {
        
        if (self.usernameTextField.text?.isEmpty == true || (self.passwordTextField.text?.isEmpty == true)){
            showAlert()
        } else {
            let newUser = PFUser()
            
            newUser.username = usernameTextField.text
            //newUser.email = emailTextField.text
            newUser.password = passwordTextField.text
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Sign Up Successful!")
                    
                }
            }
        }
        
        
        
        
    }
    
    
    @IBAction func clickedLogin(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if ((self.usernameTextField.text?.isEmpty == true) || self.passwordTextField.text?.isEmpty == true){
            showAlert()
        } else {
            PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User Login Failed: \(error.localizedDescription)")
            } else {
                print("User Login Successful!")
                }
            }
        }
        
        
        
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

