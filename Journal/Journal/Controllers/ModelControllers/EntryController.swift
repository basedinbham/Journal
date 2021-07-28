//
//  EntryController.swift
//  Journal
//
//  Created by Kyle Warren on 7/19/21.
//

import Foundation

class EntryController {

    
    //MARK: - CRUD Functions
    static func createEntry(entryTitle: String, body: String, journal: Journal) {
        
       // let newEntry = Entry(entryTitle: entryTitle, body: body)
        
        JournalController.sharedInstance.addEntryTo(journal: journal, title: entryTitle, body: body)
        }
    
    static func deleteEntry(entry: Entry, journal: Journal) {
        
        JournalController.sharedInstance.removeEntryFrom(journal: journal, entry: entry)
        
        
    }
    
    static func update(entry: Entry, title: String, body: String) {
        entry.entryTitle = title
        entry.body = body
        
        JournalController.sharedInstance.saveToPersistentStorage()
        
    }
}//End of class
