//
//  DashBoardViewController.swift
//  ayub
//
//  Created by - on 19/11/2021.
//

import UIKit

class DashBoardViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let databaseManager = DatabaseManager()
    private var datePicker: UIDatePicker!
    let signup = SignupViewController()
    var userList: [User]?
   
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        userList =  databaseManager.getData()
       
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        userList =  databaseManager.getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! DashBoardTableViewCell
        
        if let userList = self.userList {
            
            cell.label1.text = userList[indexPath.row].userName
            cell.label2.text = userList[indexPath.row].email
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            cell.label3.text = dateFormatter.string(from: userList[indexPath.row].dateOfBrith!)
            cell.label4.text = userList[indexPath.row].password
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
//  For delation
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            databaseManager.deleteUser(indexPath: indexPath)
            userList?.remove(at: indexPath.row)
            tableView.reloadData()
            
            
                           let refreshAlert = UIAlertController(title: "Confermation", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)
            
                           refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                             print("Yes")
                             }))
            
                           refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                             print(" No ")
                             }))
            
                           present(refreshAlert, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    // For updatation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       // UserDefaults.standard.set(indexPath.row, forKey: "Indexvalue")

        let vc = storyboard?.instantiateViewController(withIdentifier: "upDate") as! upDateViewController
//        present(vc,animated: true)
        vc.index = indexPath.row
        vc.loginData = userList
        vc.user = userList?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

    }


    
}
