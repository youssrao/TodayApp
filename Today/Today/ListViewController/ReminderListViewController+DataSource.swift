//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Youssra Outelli on 05/03/2022.
//

import UIKit

extension ReminderListViewController {
  //Diffable data source updates and animates the user interface when the data changes
  typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>

  //update snapshot to display changes with array of the reminder ids
  func updateSnapshot(reloading idsThatChanged: [Reminder.ID] = []) {
    let ids = idsThatChanged.filter { id in filteredReminders.contains(where: { $0.id == id }) }
    var snapshot = Snapshot()
    snapshot.appendSections([0])
    snapshot.appendItems(filteredReminders.map { $0.id })
    if !ids.isEmpty {
      snapshot.reloadItems(ids)
    }
    dataSource.apply(snapshot)
  }

  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
    //Specifies how to configure the content and appearance of a cell
    let reminder = reminder(for: id)
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = reminder.title
    contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
    contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
    cell.contentConfiguration = contentConfiguration

    var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
    doneButtonConfiguration.tintColor = UIColor.init(named: "TodayListCellDoneButtonTint")
    cell.accessories = [ .customView(configuration: doneButtonConfiguration), .disclosureIndicator(displayed: .always) ]



    var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
    backgroundConfiguration.backgroundColor = UIColor.init(named: "TodayListCellBackground")
    cell.backgroundConfiguration = backgroundConfiguration


  }

  func completeReminder(with id: Reminder.ID) {
    var reminder = reminder(for: id)
    reminder.isComplete.toggle()
    update(reminder, with: id)
    updateSnapshot(reloading: [id])

  }

  private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
    let symbolName = reminder.isComplete ? "circle.fill" : "circle"
    let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
    let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
    let button = ReminderDoneButton()
    button.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
    button.id = reminder.id
    button.setImage(image, for: .normal)
    return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))

  }

  func add(_ reminder: Reminder) {
    reminders.append(reminder)
  }

  func deleteReminder(with id: Reminder.ID) {
    let index = reminders.indexOfReminder(with: id)
    reminders.remove(at: index)
  }

  //Returns corresponding reminder from the reminders array
  func reminder(for id: Reminder.ID) -> Reminder {
    let index = reminders.indexOfReminder(with: id)
    return reminders[index]
  }

  //Update corresponding reminder from the reminders array
  func update(_ reminder: Reminder, with id: Reminder.ID) {
    let index = reminders.indexOfReminder(with: id)
    reminders[index] = reminder
  }


}
