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
}

extension Book {
    static var allBooks: [Book] {
        var books = [Book]()
        for book in Book.load() {
            books.append(book)
        }

        return books
    }

    static func load() -> [Book] {
        return [
            Book(name: "パーフェクトPHP", price: "3000", purchaseDate: "2013/04/13", imageUrl: "image1.png"),
            Book(name: "CakePHP辞典", price: "3000", purchaseDate: "2013/04/13", imageUrl: "image2.png"),
            Book(name: "パーフェクトじゃないPHP", price: "3000", purchaseDate: "2013/04/13", imageUrl: "image3.png"),
            Book(name: "CakePHPじゃない辞典", price: "3000", purchaseDate: "2013/04/13", imageUrl: "image4.png")
        ]
    }
}
