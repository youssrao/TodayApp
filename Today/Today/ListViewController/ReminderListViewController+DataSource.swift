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

  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
    //Specifies how to configure the content and appearance of a cell
      let reminder = reminders[indexPath.item]
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

  private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
    let symbolName = reminder.isComplete ? "circle.fill" : "circle"
    let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
    let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
    let button = UIButton()
    button.setImage(image, for: .normal)
    return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))

  }


}
