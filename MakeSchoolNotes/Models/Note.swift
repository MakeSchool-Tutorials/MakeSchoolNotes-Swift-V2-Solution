//
//  Note+CoreDataClass.swift
//  MakeSchoolNotes
//
//  Created by Carl Chen on 8/20/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData


public class Note: NSManagedObject {
    convenience init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)
        self.init(entity: entity!, insertInto: managedContext)
    }
}
