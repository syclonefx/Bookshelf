//
//  DatePickerTableViewCell.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/5/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
  // Outlets
  @IBOutlet var datePicker: UIDatePicker!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
