//
//  RemindersViewController.swift
//  RemindersApp
//
//  Created by Heemo on 12/7/22.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tabelViewMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewMain.isEditing = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabelViewMain.reloadData()
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
        if tabelViewMain.isEditing {
            tabelViewMain.isEditing = false
            sender.title = "Edit"
        } else {
            tabelViewMain.isEditing = true
            sender.title = "Done"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if user wants to delte a cell
        if editingStyle == .delete {
            ReminderService.shared.delete(index: indexPath.row)
            tabelViewMain.deleteRows(at: [indexPath], with: .fade
            )
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(index: indexPath.row)
        tabelViewMain.reloadData()
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Deque the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! ReminderCell
        // Get the reminder for the given index path
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        // Update the cell base on the reminder object
        cell.update(reminder: reminder, index: indexPath.row)
        // Return cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifier -> string we set in storyboard
        // destination -> references the view controller we're transitioning into
        if segue.identifier == "UpdateSegue", let newReminderViewController = segue.destination as? NewReminderViewController, let infoButton = sender as? UIButton {
            newReminderViewController.reminderIndex = infoButton.tag
        }
             
    }
    
    
}
