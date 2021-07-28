//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Kyle Warren on 7/19/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    var entry: Entry?
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    @IBAction func saveButtonTapped(_ sender: Any) {

        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty,
              let journal = journal else { return }
        
        if let entry = entry {
            // if linne 16 has value, an existing entry was selected -> update
            //Update code
            EntryController.update(entry: entry, title: title, body: body)
 
        } else {
            
            EntryController.createEntry(entryTitle: title, body: body, journal: journal)
            //If no value,
            
            
            
        }
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    @IBAction func clearsTitleTextFieldandBodyTextView(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }


    

    
    // MARK: - Navigation


    
    func updateView() {
    guard let entry = entry else { return }
        
        titleTextField.text = entry.entryTitle
        bodyTextView.text = entry.body
    }
}
