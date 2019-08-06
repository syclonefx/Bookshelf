//
//  AddBookViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/4/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

// https://github.com/appcoda/expandable-table-view


import UIKit

class AddBookViewController: UIViewController {
  // Outlets
  @IBOutlet var tableView: UITableView!
  
  // Variables
  var dataArray = [Any]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataArray.append("Book Name")
    dataArray.append("Publish Date")
    dataArray.append("")
    dataArray.append("ISBN")
    
    let datePickerNib = UINib(nibName: "DatePickerTableViewCell", bundle: nil)
    let testCellNib = UINib(nibName: "TextFieldTableViewCell", bundle: nil)
    tableView.register(datePickerNib, forCellReuseIdentifier: "DatePickerCell")
    tableView.register(testCellNib, forCellReuseIdentifier: "TextFieldCell")
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}

extension AddBookViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 2 {
      let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerTableViewCell
      return datePickerCell
    } else {
      let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldTableViewCell
      textFieldCell.textField.placeholder = dataArray[indexPath.row] as? String
      return textFieldCell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 2 {
      return 162
    }
    return 44
  }
}
