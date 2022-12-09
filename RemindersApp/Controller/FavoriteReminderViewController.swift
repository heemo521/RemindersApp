//
//  FavoriteReminderViewController.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

import UIKit

class FavoriteReminderViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let favoritedReminder = ReminderService.shared.getFavoritedReminder() {
            titleLabel.text = favoritedReminder.title
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy hh:mma"
            dateLabel.text = dateFormatter.string(from: favoritedReminder.date)
        }
    }
    
    
}
