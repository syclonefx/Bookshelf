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
  let portrait: String?
  
  init(name: String, bio: String, portrait: String) {
    self.name = name
    self.bio = bio
    self.portrait = portrait
  }
  
  init(name: String) {
    self.name = name
    self.bio = nil
    self.portrait = nil
  }
}
