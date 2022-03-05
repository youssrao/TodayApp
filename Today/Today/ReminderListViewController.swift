//
//  ViewController.swift
//  Today
//
//  Created by Youssra Outelli on 01/02/2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

      let listLayout = listLayout()
      collectionView.collectionViewLayout = listLayout
  }

  //Creates a new list configuration variable with the grouped appearance
  private func listLayout() -> UICollectionViewCompositionalLayout {
      var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
      listConfiguration.showsSeparators = false
      listConfiguration.backgroundColor = .clear

      return UICollectionViewCompositionalLayout.list(using: listConfiguration)
  }
}
