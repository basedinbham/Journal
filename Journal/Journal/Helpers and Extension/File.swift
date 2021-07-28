//
//  File.swift
//  Journal
//
//  Created by Kyle Warren on 7/20/21.
//

import Foundation

extension Date {

    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        return formatter.string(from: self)
    }
}
