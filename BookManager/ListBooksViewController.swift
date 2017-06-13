import UIKit

class ListBooksViewController: UITableViewController {

    var books = Book.allBooks

    @IBAction func tapAddAction(_ sender: Any) {
        present(R.storyboard.main.addBook()!, animated: true, completion: nil)
    }

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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.bookCell, for: indexPath) else {
            return UITableViewCell()
        }
        cell.set(books[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = R.storyboard.main.editBookViewController()
        controller?.book = books[indexPath.row]
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
