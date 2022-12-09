//
//  ReminderService.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

// Data Storage Service or Manager

import Foundation

class ReminderService {
    // Singleton
    static let shared = ReminderService()
    // initialize an empty array of Reminders
    private var reminders = [Reminder]()
    
    private var url: URL
    
    private init(){
        url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("reminder.json")
        
        load()
    }
    
    func load() {
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            reminders = try decoder.decode([Reminder].self, from: data)
        } catch {
            print("error saving file \(error.localizedDescription)")
        }
    }
    
    func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(reminders)
            try data.write(to: url)
        } catch {
            print("error saving file \(error.localizedDescription)")
        }
    }
    // Create
    func create(reminder: Reminder) {
        // Add reminder to reminders array in a sorted array
        var indexToInsert: Int?
        for (index, element) in reminders.enumerated() {
            if element.date.timeIntervalSince1970 > reminder.date.timeIntervalSince1970 {
                indexToInsert = index
                break
            }
        }
        
        if let indexToInsert = indexToInsert {
            reminders.insert(reminder, at: indexToInsert)
        } else {
            reminders.append(reminder)
        }
        
        save()
    }
    // Update
    func update(reminder: Reminder, index: Int) {
        reminders[index] = reminder
        save()
    }
    // Get # of reminders
    func getCount() -> Int {
        return reminders.count
    }
    // Get a specific remidner
    func getReminder(index: Int) -> Reminder {
        return reminders[index]
    }
    // Toggle the status of reminder
    func toggleCompleted(index: Int) {
        let reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
        save()
    }
    // Get the list of reminder
    func getReminders() -> [Reminder] {
        return reminders
    }
    // Delete the reminder
    func delete(index: Int) {
        reminders.remove(at: index)
        save()
    }
    // Get the favorited reminder
    func getFavoritedReminder() -> Reminder? {
        return reminders.first
    }
}
