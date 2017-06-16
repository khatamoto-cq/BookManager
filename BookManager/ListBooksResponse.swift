import Foundation
import Himotoki

struct ListBooksResponse: Decodable {
    var books: [BookResponse] = []

    static func decode(_ e: Extractor) throws -> ListBooksResponse {
        return try ListBooksResponse(books: e <|| "result")
    }
}
