import Foundation
import Himotoki

struct BookResponse: Decodable {
    let id: Int
    var imageUrl: String
    var name: String
    var price: Int
    var purchaseDate: String?

    static func decode(_ e: Extractor) throws -> BookResponse {
        return try BookResponse(id: e <| "id", imageUrl: e <| "image_url",
                        name: e <| "name", price: e <| "price",
                        purchaseDate: e <|? "purchase_date")
    }
}
