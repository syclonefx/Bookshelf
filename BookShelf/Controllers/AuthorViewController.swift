//
//  AuthorViewController.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {

  // Outlets
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var bioLabel: UILabel!
  
  // Variables
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let authorIndex = DataService.instance.authorIndex
    let author = DataService.instance.authors[authorIndex]
    
    nameLabel.text = author.name
    guard let bio = author.bio else {
      bioLabel.text = "No Bio Added"
      return
    }
    bioLabel.text = bio
  }
  
  // Actions

}
