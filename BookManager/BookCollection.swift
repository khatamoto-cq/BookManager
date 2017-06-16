import Foundation
import Himotoki

struct BookCollection: Decodable {
    var books: [Book] = []

    static func decode(_ e: Extractor) throws -> BookCollection {
        return try BookCollection(books: e <|| "result")
    }
}
