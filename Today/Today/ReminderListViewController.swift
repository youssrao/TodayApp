//
//  ViewController.swift
//  Today
//
//  Created by Youssra Outelli on 01/02/2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
  //Diffable data source updates and animates the user interface when the data changes
  typealias DataSource = UICollectionViewDiffableDataSource<Int, String>

  var dataSource: DataSource!


  override func viewDidLoad() {
      super.viewDidLoad()

      let listLayout = listLayout()
      collectionView.collectionViewLayout = listLayout

    //Specifies how to configure the content and appearance of a cell
    let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
      let reminder = Reminder.testData[indexPath.item]
      var contentConfiguration = cell.defaultContentConfiguration()
      contentConfiguration.text = reminder.title
      cell.contentConfiguration = contentConfiguration



    }

    //Pass collection view to the data source and return cell
    dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)

            }

  }

  //Creates a new list configuration variable with the grouped appearance
  private func listLayout() -> UICollectionViewCompositionalLayout {
      var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
      listConfiguration.showsSeparators = false
      listConfiguration.backgroundColor = .clear

      return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }
}
