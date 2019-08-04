//
//  Author.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import Foundation

class Author {
  let name: String
  let bio: String?
  
  init(name: String, bio: String) {
    self.name = name
    self.bio = bio
  }
  
  init(name: String) {
    self.name = name
    self.bio = nil
  }
}
