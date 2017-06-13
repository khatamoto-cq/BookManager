import UIKit

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

    func set(_ book: Book) {
        bookImageView.image = UIImage(named: book.imageUrl)
        nameLabel.text = book.name
        priceLabel.text = book.price
        purchaseDateLabel.text = book.purchaseDate
    }
}
