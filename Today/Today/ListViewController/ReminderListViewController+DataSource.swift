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
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

  func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: String) {
    //Specifies how to configure the content and appearance of a cell
      let reminder = Reminder.testData[indexPath.item]
      var contentConfiguration = cell.defaultContentConfiguration()
      contentConfiguration.text = reminder.title
      contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
      contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
      cell.contentConfiguration = contentConfiguration


    var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
    backgroundConfiguration.backgroundColor = UIColor.init(named: "TodayListCellBackground")
    cell.backgroundConfiguration = backgroundConfiguration


  }
}
