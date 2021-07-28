//
//  Journals.swift
//  Journal
//
//  Created by Kyle Warren on 7/20/21.
//

import Foundation

class Journal: Codable {
    var title: String
    var entries: [Entry]
    let uuid: String
    
    init(title: String, entries: [Entry] = [], uuid: String = UUID().uuidString) {
        self.title = title
        self.entries = entries
        self.uuid = uuid
    }
    
}

extension Journal: Equatable {
static func == (lhs: Journal, rhs: Journal) -> Bool {
    return lhs.uuid == rhs.uuid
    }
}
