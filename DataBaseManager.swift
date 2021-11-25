//
//  DataBase.swift
//  ayub
//
//  Created by - on 19/11/2021.
//



import Foundation

import UIKit
import CoreData



class DatabaseManager

{
     var loginData = [User]()
    var tempData = [User]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func creatItems(username:String,email: String,password: String,comformpassword: String,dataOfBrith:Date){
        let newuser = User(context: context)
        newuser.userName = username
        newuser.email = email
        newuser.password = password
        newuser.comform_Password = comformpassword
        newuser.dateOfBrith = dataOfBrith
        
        do{
            try context.save()
            print("Data is saved")
        }catch{
            print("Data is not saved")
        }
        
    }
    


    func getData()-> [User]
    {
        do{
            loginData = try context.fetch(User.fetchRequest())
        }
        catch
        {
            print(error.localizedDescription)
        }
        return loginData
    }

    
    
    func checkIfItemExist(item: String, coloumn: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "\(coloumn) == %@" ,item)
        do {
            
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }

    
    

    func validateUser(email: String, pass: String) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@" ,email,pass)
        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError
        {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    
    
    func deleteUser(indexPath:IndexPath)
       {
           let eventArrayItem = loginData[indexPath.row]
               context.delete(eventArrayItem)
               do {
                   try context.save()
               }
           catch let error as NSError {
                       print("Error While Deleting Note: \(error.userInfo)")}
       }
    
    
    
    
    //    get email from database
    func getUserDetail(email:String) -> [User]

       {
           let request: NSFetchRequest<User> = User.fetchRequest()
           request.predicate = NSPredicate(format: "email = %@" ,email)
           do
           {
               tempData = try context.fetch(request)
           }
           catch
           {
               print("Error Fetching User")
           }
           return tempData
       }

    
    

       }
  



