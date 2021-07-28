//
//  Entry.swift
//  Journal
//
//  Created by Kyle Warren on 7/19/21.
//

import Foundation

class Entry: Codable {
    
    var entryTitle: String
    var body: String
    let timestamp: Date
    let uuid: String
    
    init(entryTitle: String, body: String, timestamp: Date = Date(), uuid: String = UUID().uuidString) {
        self.entryTitle = entryTitle
        self.body = body
        self.timestamp = timestamp
        self.uuid = uuid
    }
}

//MARK: - Extensions

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
    return lhs.uuid == rhs.uuid
    
    }
}

