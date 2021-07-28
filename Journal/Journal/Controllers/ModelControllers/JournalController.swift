//
//  JournalController.swift
//  Journal
//
//  Created by Kyle Warren on 7/20/21.
//

import Foundation

class JournalController{
    ///shared instance (singleton): read/wrtie from the same instance in memory.  Side benefit of global access to funcs/properties on that class instance.
    static let sharedInstance = JournalController()
    ///SOT
    var journals: [Journal] = []
    
    //MARK: - CRUD
    func createJournalWith(title: String) {
        let newJournal = Journal(title: title)
        journals.append(newJournal)
        
        saveToPersistentStorage()
    }
    
    func delete(journal: Journal){
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        
        saveToPersistentStorage()
        

    }
    
    func addEntryTo(journal: Journal, title: String, body: String) {
        let newEntry = Entry(entryTitle: title, body: body)
            journal.entries.append(newEntry)
        
            saveToPersistentStorage()
        
    }
    
    func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let index = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    
    //MARK: - Persistence
    private func fileURL() -> URL {
     let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
     let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
     return documentsDirectoryURL
    }
    
    func saveToPersistentStorage(){
        do{
            
            let data = try JSONEncoder().encode(journals)
            try data.write(to: fileURL())
            
        } catch {
            print("there's an error")
        }
        
    }
    func loadFromPersistentStorage() {
        do{
            
            let data = try Data(contentsOf: fileURL())
            let journals = try JSONDecoder().decode([Journal].self, from: data)
                self.journals = journals
        } catch {
            print("Could not load")
            
        }
        
}
    
    
}//End of class
