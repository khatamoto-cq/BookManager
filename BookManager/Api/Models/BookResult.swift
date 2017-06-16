import Foundation
import Himotoki

struct BookResult: Decodable {
    let bookId: Int

    static func decode(_ e: Extractor) throws -> BookResult {
        return try BookResult(bookId: e <| "book_id")
    }
}
