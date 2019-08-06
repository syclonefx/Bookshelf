//
//  TextFieldTableViewCell.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/5/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
  // Outlets
  @IBOutlet var textField: UITextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  
}
