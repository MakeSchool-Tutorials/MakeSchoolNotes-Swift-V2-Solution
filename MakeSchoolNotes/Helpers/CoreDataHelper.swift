//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Carl Chen on 8/20/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func saveNote(){
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func deleteNote(_ note: Note){
        managedContext.delete(note)
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return []
    }
    
}
