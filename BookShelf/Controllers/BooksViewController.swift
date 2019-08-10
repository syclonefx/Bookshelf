//
//  ViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

  // Outlets
    @IBOutlet var tableView: UITableView!
    
  // Variables
  var books = [Book]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //books = DataService.instance.books
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    books = DataService.instance.books
    tableView.reloadData()
  }
  
  // Actions
  
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
    let book = books[indexPath.row]
    
    cell.textLabel?.text = book.name
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    DataService.instance.bookIndex = indexPath.row
    performSegue(withIdentifier: "BookSegue", sender: self)
  }
}

