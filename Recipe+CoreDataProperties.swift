//
//  Recipe+CoreDataProperties.swift
//  recipez
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var image: NSData?
    @NSManaged var items: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?

}
