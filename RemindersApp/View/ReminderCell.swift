//
//  ReminderCell.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

import UIKit

class ReminderCell: UITableViewCell {
    @IBOutlet weak var isCompleted: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoButton: UIView!
    
    func update(reminder: Reminder, index: Int) {
        infoButton.tag = index
        titleLabel.text = reminder.title
        
        isCompleted.layer.cornerRadius = isCompleted.frame.size.width / 2.0
        isCompleted.layer.borderColor = UIColor.lightGray.cgColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted {
            isCompleted.backgroundColor = UIColor.systemMint
            isCompleted.layer.borderWidth = 0.0
        } else {
            isCompleted.backgroundColor = UIColor.white
            isCompleted.layer.borderWidth = 2.0
            
        }
    }
    
}

