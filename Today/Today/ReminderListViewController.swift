//
//  ViewController.swift
//  Today
//
//  Created by Youssra Outelli on 01/02/2022.
//

import UIKit

class ReminderListViewController: UITableViewController {




}


extension ReminderListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
}
