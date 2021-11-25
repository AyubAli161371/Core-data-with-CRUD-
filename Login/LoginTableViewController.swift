//
//  LoginTableViewController.swift
//  ayub
//
//  Created by - on 05/11/2021.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let manager = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        if let password = self.storyboard?.instantiateViewController(identifier: "forgotPassword") as? ShowPasswordViewController{
                    self.navigationController?.pushViewController(password, animated: true)
        }
        
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        // atfer refector
        ValidationCode()
        
        //manager.creatItems(email: txtEmail.text!, password: txtPassword.text!)
       if manager.validateUser(email: txtEmail.text!, pass: txtPassword.text!)
        {
           let email = txtEmail.text
          // UserDefaults.standard.setUserEmail(email: email!)
           let vc = storyboard?.instantiateViewController(withIdentifier: "dashboard") as! DashBoardViewController
         //  present(vc,animated: true)
           self.navigationController?.pushViewController(vc, animated: true)
       }
        else
        {
            print("user not exist")
        }
 
    }
    


    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
                    self.navigationController?.pushViewController(signupVC, animated: true)
        }
        
    }
    
  
}


// it will adjust accourding to scren

// for spaceing from top
extension LoginTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}

// validation code of first screen
extension LoginTableViewController{
    fileprivate func ValidationCode() {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == ""
        {
            print("Please Enter Email")
        }
        else if password == ""
        {
            print("Please Enter Password")
        }
        else if email!.validateEmailId(email: email!) == false
            {
               print("please enter valid email")
            }
    }
    
}




