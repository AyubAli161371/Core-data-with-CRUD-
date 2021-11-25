//
//  User+CoreDataProperties.swift
//  
//
//  Created by - on 18/11/2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?
    @NSManaged public var comform_Password: String?
    @NSManaged public var dateOfBrith: Date?

}
