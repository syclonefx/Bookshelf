//
//  AuthorsViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class AuthorsViewController: UIViewController {

  // Outlets
  @IBOutlet var tableView: UITableView!
    
  // Variables
  var authors = [Author]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    authors = DataService.instance.authors
    
    tableView.delegate = self
    tableView.dataSource = self
  }

  // Actions
  
}

extension AuthorsViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return authors.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath)
    let author = authors[indexPath.row]
    
    cell.textLabel?.text = author.name
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    DataService.instance.authorIndex = indexPath.row
    performSegue(withIdentifier: "AuthorSegue", sender: self)
  }
  
}
