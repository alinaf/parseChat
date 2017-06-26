//
//  ChatViewController.swift
//  parseChat
//
//  Created by Alina Abidi on 6/26/17.
//  Copyright © 2017 Alina + Claire. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Outlets/Actions
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var chatMessageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var chats: [PFObject]?
    
    @IBAction func didPressSend(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message_fbu2017")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage["user"] = PFUser.current()
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("Your message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    func onTimer(){
        //query
        var query = PFQuery(className: "Message_fbu2017")
        query.includeKey("user")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if error == nil {
                self.chats = posts
                self.tableView.reloadData()
            } else {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let chat = chats![indexPath.row]
        let text = chat["text"] as! String
        
        if let user = chat["user"] as? PFUser {
            cell.usernameLabel.text = user.username
        } else {
            cell.usernameLabel.text = "Guest"}
        
        cell.chatLabel.text = text
        
        
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
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
