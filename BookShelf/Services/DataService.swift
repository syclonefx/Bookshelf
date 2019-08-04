//
//  DataService.swift
//  BookShelf
//
//  Created by Chuck Perdue on 8/3/19.
//  Copyright © 2019 SycloneFX, LLC. All rights reserved.
//

import Foundation

class DataService {
  static let instance = DataService()
  
  // Variables
  var bookIndex = 0
  var authorIndex = 0
  var authors = [Author]()
  var books = [Book]()
  
  func addBooks(){
    let today = Date()
    var authors = [Author]()
    let timFerris = Author(name: "Tim Ferris")
    authors.append(timFerris)
    
    books.append(Book(name: "The 4 Hour Work Week", isbn: "", publishDate: today, genre: Genre.selfHelp.rawValue, coverImage: "placeholder", authors: authors))
    books.append(Book(name: "The 4 Hour Chef", isbn: "", publishDate: today, genre: Genre.selfHelp.rawValue, coverImage: "placeholder", authors: authors))
    
    authors.removeAll()
    let tonyRobbins = Author(name: "Tony Robbins")
    authors.append(tonyRobbins)
    books.append(Book(name: "Unshakable", isbn: "", publishDate: today, genre: Genre.investing.rawValue, coverImage: "placeholder", authors: authors))
  }
  
  func addAuthors() {
    let timFerris = Author(name: "Tim Ferris")
    let tonyRobbins = Author(name: "Tony Robbins")
    
    authors.append(timFerris)
    authors.append(tonyRobbins)
  }
  
  
}
