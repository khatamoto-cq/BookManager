import Foundation
import Himotoki

struct Auth: Decodable {
    let userId: Int
    let requestToken: String

    static func decode(_ e: Himotoki.Extractor) throws -> Auth {
        return try Auth(userId: e <| ["user_id"],
                        requestToken: e <| ["request_token"])
    }
}
