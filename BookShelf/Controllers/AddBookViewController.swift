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
  @IBOutlet var bookNameText: UITextField!
  @IBOutlet var isbnText: UITextField!
  @IBOutlet var datePicker: UIDatePicker!
  @IBOutlet var publishDateButton: UIButton!
  @IBOutlet weak var datePickerHeightConstraints: NSLayoutConstraint!
  @IBOutlet var genreButton: UIButton!
  @IBOutlet var genrePicker: UIPickerView!
  @IBOutlet weak var genrePickerHeightConstraints: NSLayoutConstraint!
  
  // Variables
  var authors = [Author]()
  var genre = ""
  var publishDate = Date()
  var publishDateString = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    authors = DataService.instance.authors
    
    tableView.delegate = self
    tableView.dataSource = self
    
    genrePicker.delegate = self
    genrePicker.dataSource = self
    
    datePicker.timeZone = NSTimeZone.system
    datePicker.datePickerMode = .date
    datePicker.addTarget(self, action: #selector(getDate(datePicker:)), for: .valueChanged)
  }
  
  @objc func getDate(datePicker: UIDatePicker) {
    publishDate = datePicker.date
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-YYYY hh:mm:ss"
    publishDateString = dateFormatter.string(from: publishDate)
    
    print("Publish Date: \(publishDateString)")
  }
  
  // Actions
  @IBAction func genreButtonTapped(_ sender: UIButton) {
    view.layoutIfNeeded()
    if genrePicker.isHidden {
      genrePicker.isHidden = false
      UIView.animate(
        withDuration: 0.5,
        delay: 0.0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 10,
        animations: {
          self.genrePickerHeightConstraints.constant = 216
          self.view.layoutIfNeeded()
        },
        completion: nil)
    } else {
      genrePicker.isHidden = true
      if genre != "" {
        genreButton.setTitle("Genre: \(genre)", for: .normal)
      } else {
        genreButton.setTitle("Genre", for: .normal)
      }
      UIView.animate(
        withDuration: 0.5,
        delay: 0.0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 10,
        animations: {
          self.genrePickerHeightConstraints.constant = 0
          self.view.layoutIfNeeded()
      }, completion: nil)
    }
  }
  
  @IBAction func publishDateButtonTapped(_ sender: UIButton) {
    view.layoutIfNeeded()
    if datePicker.isHidden {
      datePicker.isHidden = false
      UIView.animate(
        withDuration: 0.5,
        delay: 0.0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 10,
        animations: {
          self.datePickerHeightConstraints.constant = 216
          self.view.layoutIfNeeded()
      },
        completion: nil)
      
    } else {
      datePicker.isHidden = true
      if publishDateString != "" {
        publishDateButton.setTitle("Publish Date: \(publishDateString)", for: .normal)
      }
      if genre != "" {
        genreButton.setTitle("Genre: \(genre)", for: .normal)
      } else {
        genreButton.setTitle("Genre", for: .normal)
      }
      UIView.animate(
        withDuration: 0.5,
        delay: 0.0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 10,
        animations: {
          self.datePickerHeightConstraints.constant = 0
          self.view.layoutIfNeeded()
      },
        completion: nil)
    }
  }
  
}

extension AddBookViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Authors"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return authors.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "authorCell", for: indexPath)
    if cell.accessoryType == .none {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    cell.textLabel?.text = authors[indexPath.row].name
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
    }
    return indexPath
  }
  
}

extension AddBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return Genre.allCases.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return Genre.allCases[row].rawValue
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    genre = Genre.allCases[row].rawValue
    print("Genre: \(genre)")
  }
  
}
