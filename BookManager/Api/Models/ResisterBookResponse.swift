import Foundation
import Himotoki

struct ResisterBookResponse: Decodable {
    let bookId: Int

    static func decode(_ e: Extractor) throws -> ResisterBookResponse {
        return try ResisterBookResponse(bookId: e <| "book_id")
    }
}
