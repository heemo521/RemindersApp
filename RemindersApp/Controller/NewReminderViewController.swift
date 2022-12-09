//
//  NewReminderViewController.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

import UIKit

class NewReminderViewController: UIViewController {
    var reminderIndex: Int?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var isCompleted: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let reminderIndex = reminderIndex {
            let reminder = ReminderService.shared.getReminder(index: reminderIndex)
            titleTextField.text = reminder.title
            datePicker.date = reminder.date
            isCompleted.isOn = reminder.isCompleted
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let reminder = Reminder(title: titleTextField.text!, date: datePicker.date, isCompleted: isCompleted.isOn)
        
        if let reminderIndex = reminderIndex {
            ReminderService.shared.update(reminder: reminder, index: reminderIndex)
        } else {
            ReminderService.shared.create(reminder: reminder)
        }
        
        navigationController!.popViewController(animated: true)
    }
}
