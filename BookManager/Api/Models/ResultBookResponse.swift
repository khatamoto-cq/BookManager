import Foundation
import Himotoki

struct ResultBookResponse: Decodable {
    let bookId: Int

    static func decode(_ e: Extractor) throws -> ResultBookResponse {
        return try ResultBookResponse(bookId: e <| "book_id")
    }
}
