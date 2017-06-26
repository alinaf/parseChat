//
//  ChatViewController.swift
//  parseChat
//
//  Created by Alina Abidi on 6/26/17.
//  Copyright © 2017 Alina + Claire. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    // Variables
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    
    @IBAction func didPressSend(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message_fbu2017")
        chatMessage["text"] = chatMessageField.text ?? ""
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("Your message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}