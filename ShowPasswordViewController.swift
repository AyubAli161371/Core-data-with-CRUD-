//
//  ShowPasswordViewController.swift
//  ayub
//
//  Created by - on 24/11/2021.
//

import UIKit

class ShowPasswordViewController: UIViewController {
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var emialPassword: UILabel!
    
    
    let databaseManager = DatabaseManager()
    var userList: [User]?
    var passKey:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emialPassword.isHidden = true
    }
    
    
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func showPass(_ sender: Any) {
        let email = txtPassword.text
        if email == ""
        {
            print("Please enter Email")
        }
        else if databaseManager.checkIfItemExist(item: email!, coloumn: "email") == false
        {
            print("User Not Exist")
        }
        else
        {
            let user = databaseManager.getUserDetail(email: email!)
            for user in user {
                passKey = user.password
            }
          
            
            emialPassword.text = "Your Password is:  \(passKey!)"
            emialPassword.isHidden = false
        }
    }
    
}
