//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit


class ListNotesTableViewController: UITableViewController {
    
    var notes: [Note] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNotes()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        let row = (indexPath as NSIndexPath).row
        let note = notes[row]
        cell.noteTitleLabel.text = note.title
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[(indexPath as NSIndexPath).row]
                let destination = segue.destination as! DisplayNoteViewController
                destination.note = note
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue){
        self.notes = CoreDataHelper.retrieveNotes()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataHelper.deleteNote(notes[(indexPath as NSIndexPath).row])
        notes = CoreDataHelper.retrieveNotes()
    }
    
}
