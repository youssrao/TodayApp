//
//  DatePickerContentView.swift
//  Today
//
//  Created by Youssra Outelli on 19/03/2022.
//

import UIKit

//custom view object that displays the date picker in an editable area
class DatePickerContentView: UIView, UIContentView {
  struct Configuration: UIContentConfiguration {
    var date = Date.now

    func makeContentView() -> UIView & UIContentView {
      return DatePickerContentView(self)
    }
  }

  let datePicker = UIDatePicker()
  var configuration: UIContentConfiguration {
    didSet {
      configure(configuration: configuration)
    }
  }

  init(_ configuration: UIContentConfiguration) {
    self.configuration = configuration
    super.init(frame: .zero)
    addPinnedSubview(datePicker)
    datePicker.preferredDatePickerStyle = .inline
    datePicker.locale = Locale(identifier: "nl_NL")
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(configuration: UIContentConfiguration) {
    guard let configuration = configuration as? Configuration else { return }
    datePicker.date = configuration.date
  }
}

extension UICollectionViewListCell {
  func datePickerConfiguration() -> DatePickerContentView.Configuration {
    DatePickerContentView.Configuration()
  }
}
