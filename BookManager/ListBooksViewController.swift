import UIKit
import APIKit
import Himotoki

class ListBooksViewController: UITableViewController {

    var books: [Book] = []

    @IBAction func tapAddAction(_ sender: Any) {
        present(R.storyboard.main.addBook()!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let token = UserDefaults.standard.string(forKey: "request_token")!
        let userId = UserDefaults.standard.integer(forKey: "user_id")
        let listBooksRequest = ListBooksRequest(userId: userId, page: "0-10", token: token)

        Session.send(listBooksRequest) { result in
            switch result {
            case .success(let bookCollection):
                self.books = bookCollection.books
                self.loadView()
            case .failure(let error):
                print("error: \(error)")
            }
        }
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
