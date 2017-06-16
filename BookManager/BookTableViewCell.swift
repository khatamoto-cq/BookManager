import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        // 元々入っている情報を再利用時にクリア
        bookImageView.image = nil
    }

    func set(_ book: BookResponse) {
        if !book.imageUrl.isEmpty {
            let url = URL(string: book.imageUrl)
            bookImageView.kf.setImage(with: url)
        }
        nameLabel.text = book.name
        priceLabel.text = R.string.localizable.labelPrice(book.price)

        if let date = book.purchaseDate {
            purchaseDateLabel.text = Date.transformFromApiDateToClientDate(date: date)
        }
    }
}
