//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Youssra Outelli on 14/03/2022.
//

import UIKit

//Calls update when user tapped button
extension ReminderListViewController {
  @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
    guard let id = sender.id else { return }
    completeReminder(with: id)


     }

}
