//
//  Book.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import Foundation

enum Genre: String {
  case fantasy = "Fantasy"
  case scienceFiction = "Science Fiction"
  case romance = "Romance"
  case western = "Western"
  case thriller = "Thriller"
  case mystery = "Mystery"
  case dystopia = "Dystopia"
  case business = "Business"
  case financial = "Financial"
  case selfHelp = "Self Help"
  case investing = "Investing"
}

class Book {
  let name: String
  let isbn: String?
  let publishDate: Date?
  let genre: String?
  var authors: [Author]?
  
  init(name: String, isbn: String, publishDate: Date, genre: String, authors: [Author]) {
    self.name = name
    self.isbn = isbn
    self.publishDate = publishDate
    self.genre = genre
    self.authors = authors
  }
  
  init(name: String) {
    self.name = name
    self.isbn = nil
    self.publishDate = nil
    self.genre = nil
    self.authors = nil
  }
}
