import Foundation
import Himotoki

struct Book: Decodable {
    let id: Int
    let imageUrl: String
    let name: String
    let price: Int
    let purchaseDate: String

    static func decode(_ e: Himotoki.Extractor) throws -> Book {
        return try Book(id: e <| ["id"], imageUrl: e <| ["image_url"],
                        name: e <| ["name"], price: e <| ["price"],
                        purchaseDate: e <| ["purchase_date"])
    }
}
