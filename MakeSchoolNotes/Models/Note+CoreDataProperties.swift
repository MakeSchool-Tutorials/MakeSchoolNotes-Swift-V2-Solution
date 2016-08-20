//
//  Note+CoreDataProperties.swift
//  MakeSchoolNotes
//
//  Created by Carl Chen on 8/20/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import CoreData

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var modificationTime: Date?

}
