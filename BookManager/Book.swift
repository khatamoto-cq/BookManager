import Foundation
import UIKit

struct Book {
    // MARK: Properties
    let name: String
    let price: String
    let purchaseDate: String
    let imageUrl: String

    static let Name = "name"
    static let Price = "price"
    static let PurchaseDate = "purchaseDate"
    static let ImageUrl = "imageUrl"

    init(dictionay: [String : String]) {
        self.name = dictionay[Book.Name]!
        self.price = dictionay[Book.Price]!
        self.purchaseDate = dictionay[Book.PurchaseDate]!
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
            [Book.Name: "パーフェクトPHP", Book.Price: "3000", Book.PurchaseDate: "2013/04/13", Book.ImageUrl: "image1.png"],
            [Book.Name: "CakePHP辞典", Book.Price: "3000", Book.PurchaseDate: "2013/04/13", Book.ImageUrl: "image2.png"],
            [Book.Name: "パーフェクトじゃないPHP", Book.Price: "3000", Book.PurchaseDate: "2013/04/13",
             Book.ImageUrl: "image3.png"],
            [Book.Name: "CakePHPじゃない辞典", Book.Price: "3000", Book.PurchaseDate: "2013/04/13",
             Book.ImageUrl: "image4.png"]
        ]
    }
}
