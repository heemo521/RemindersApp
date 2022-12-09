//
//  Reminder.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

import Foundation
// Data Storage
class Reminder: Codable {
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
