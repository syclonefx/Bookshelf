//
//  AddAuthorViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/4/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class AddAuthorViewController: UIViewController {

  // Outlets
  @IBOutlet var nameText: UITextField!
  @IBOutlet var bioText: UITextView!
  @IBOutlet var tableView: UITableView!
  
  // Variables
  let books = DataService.instance.books
  var authorBooks = [Book]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // Actions
  @IBAction func addAuthor(_ sender: UIBarButtonItem) {
    if let name = nameText.text,
      let bio = bioText.text {
      let newAuthor = Author(name: name, bio: bio, portrait: nil)
      DataService.instance.authors.append(newAuthor)
      navigationController?.popViewController(animated: true)
    }
  }
}

extension AddAuthorViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    if cell.accessoryType == .none {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    cell.textLabel?.text = books[indexPath.row].name
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if let cell = tableView.cellForRow(at: indexPath) {
      let selectedBook = books[indexPath.row]
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
        authorBooks.append(selectedBook)
      } else {
        cell.accessoryType = .none
        if authorBooks.count > 0 {
          if let index = authorBooks.firstIndex(where: { $0 === selectedBook }) {
            authorBooks.remove(at: index)
          }
        }
      }
    }
    return indexPath
  }
  
}
