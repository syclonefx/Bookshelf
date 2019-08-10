//
//  BookViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

  // Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
  // Variables
  
  override func viewDidLoad() {
    super.viewDidLoad()
    authorLabel.text = ""
    let bookIndex = DataService.instance.bookIndex
    let book = DataService.instance.books[bookIndex]
    nameLabel.text = book.name
    if let authors = book.authors {
      var auth = authors[0].name
      if authors.count > 1 {
        for author in authors {
          auth = "\(auth) and \(author.name)"
        }
      }
      authorLabel.text = "by \(auth)"
    }
  }
  
  // Actions

}
