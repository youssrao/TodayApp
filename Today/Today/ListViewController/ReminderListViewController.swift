//
//  ViewController.swift
//  Today
//
//  Created by Youssra Outelli on 01/02/2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
  var dataSource: DataSource!
  var reminders: [Reminder] = Reminder.testData


  override func viewDidLoad() {
    super.viewDidLoad()

    let listLayout = listLayout()
    collectionView.collectionViewLayout = listLayout

    let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

    //Pass collection view to the data source and return cell
    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)

    }

    //append items and sections to snapshot and display this on screen
    var snapshot = Snapshot()
    snapshot.appendSections([0])
    snapshot.appendItems(reminders.map { $0.id })
    dataSource.apply(snapshot)

    updateSnapshot()


    collectionView.dataSource = dataSource

  }

  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    let id = reminders[indexPath.item].id
    showDetail(for: id)
    return false
  }

  func showDetail(for id: Reminder.ID) {
    let reminder = reminder(for: id)
    let viewController = ReminderViewController(reminder: reminder) { [weak self] reminder in
      self?.update(reminder, with: reminder.id)
      self?.updateSnapshot(reloading: [reminder.id])
    }
    navigationController?.pushViewController(viewController, animated: true)
  }

  //Creates a new list configuration variable with the grouped appearance
  private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
    listConfiguration.showsSeparators = false
    listConfiguration.backgroundColor = .clear

    return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }
}
