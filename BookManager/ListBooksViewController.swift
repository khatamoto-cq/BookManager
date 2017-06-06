//
//  ListBooksViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class ListBooksViewController: UITableViewController {

    var books = Book.allBooks

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell",
                                                       for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }

        let book = books[indexPath.row]
        cell.bookImageView.image = UIImage(named: book.imageUrl)
        cell.nameLabel.text = book.name
        cell.priceLabel.text = book.price
        cell.publishDateLabel.text = book.publishDate

        return cell
    }
}
