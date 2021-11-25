//
//  upDateViewController.swift
//  ayub
//
//  Created by - on 22/11/2021.
//

import UIKit
import CoreData

class upDateViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtComPassword: UITextField!
    @IBOutlet weak var upDate: UIButton!
    var index: Int?
    var loginData: [User]?
    var user: User?
    
    var row = UserDefaults.standard.integer(forKey: "Indexvalue")
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let databaseManager = DatabaseManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        selectedDataShow()
        
    }
    

    @IBAction func upDateButton(_ sender: Any) {
        
        var isUserEmailAlreadyExist = false
        
        if let loginData = self.loginData {
            
            for user in loginData {
                
                if self.user?.email != txtEmail.text && user.email == txtEmail.text {
                    isUserEmailAlreadyExist = true
                }
                
            }
            
        }
        
        if isUserEmailAlreadyExist {
            
            let alertController = UIAlertController(title: "Alert!", message: "Email Already Exist", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            self.update(row: self.index ?? 0)
            
        }
        
       // performSegue(withIdentifier: "dashboard", sender: DashBoardViewController?.self)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "dashboard") as! DashBoardViewController
//        present(vc,animated: true)
        

//
    }
    
    
    // reciving of data from view
    func selectedDataShow() {
        
        txtUsername.text = user?.userName
        txtEmail.text = user?.email
        txtPassword.text = user?.password
        txtComPassword.text = user?.comform_Password
        
    }
    
    //   Afer updation to save data 
    func update(row:Int)
    {
        
//
//        if txtEmail.text != databaseManager.getData()[row].email
//        {
//            if databaseManager.checkIfItemExist(item: txtEmail.text!, coloumn: "email") == false
//            {
//                //code
//                databaseManager.getData()
//                databaseManager.getData()[row].userName = txtUsername.text
//                databaseManager.getData()[row].email = txtEmail.text
//                databaseManager.getData()[row].password = txtPassword.text
//                databaseManager.getData()[row].comform_Password = txtComPassword.text
//
//                do{
//                    try context.save()
//                    self.navigationController?.popViewController(animated: true)
//                    print("Data is saved")
//                }catch{
//                    print("Data is not saved")
//                }
//            }
//            else
//            {
//                print("User with provided email address already exist")
//            }
//        }
//        else
//        {
            databaseManager.getData()
            databaseManager.getData()[row].userName = txtUsername.text
            databaseManager.getData()[row].email = txtEmail.text
            databaseManager.getData()[row].password = txtPassword.text
            databaseManager.getData()[row].comform_Password = txtComPassword.text
           
            do{
                try context.save()
                self.navigationController?.popViewController(animated: true)
                print("Data is saved")
            }catch{
                print("Data is not saved")
            }
//        }
    }

}
