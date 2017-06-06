//
//  Book.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/06.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import Foundation
import UIKit

struct Book {
    // MARK: Properties
    let name: String
    let price: String
    let publishDate: String
    let imageUrl: String

    static let Name = "name"
    static let Price = "price"
    static let PublishDate = "publishDate"
    static let ImageUrl = "imageUrl"

    init(dictionay: [String : String]) {
        self.name = dictionay[Book.Name]!
        self.price = dictionay[Book.Price]!
        self.publishDate = dictionay[Book.PublishDate]!
        self.imageUrl = dictionay[Book.ImageUrl]!
    }
}

extension Book {
    static var allBooks: [Book] {
        var books = [Book]()
        for book in Book.load() {
            books.append(Book(dictionay: book))
        }

        return books
    }

    static func load() -> [[String : String]] {
        return [
            [Book.Name: "パーフェクトPHP", Book.Price: "3000", Book.PublishDate: "2013/04/13", Book.ImageUrl: "image1.png"],
            [Book.Name: "CakePHP辞典", Book.Price: "3000", Book.PublishDate: "2013/04/13", Book.ImageUrl: "image2.png"],
            [Book.Name: "パーフェクトじゃないPHP", Book.Price: "3000", Book.PublishDate: "2013/04/13",
             Book.ImageUrl: "image3.png"],
            [Book.Name: "CakePHPじゃない辞典", Book.Price: "3000", Book.PublishDate: "2013/04/13",
             Book.ImageUrl: "image4.png"]
        ]
    }
}
