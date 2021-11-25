//
//  UIViewController.swift
//  ayub
//
//  Created by - on 05/11/2021.
//

//import UIKit
//
//class UIViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//
//}


import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
