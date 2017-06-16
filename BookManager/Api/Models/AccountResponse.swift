import Foundation
import Himotoki

struct AccountResponse: Decodable {
    let userId: Int
    let requestToken: String

    static func decode(_ e: Extractor) throws -> AccountResponse {
        return try AccountResponse(userId: e <| "user_id",
                        requestToken: e <| "request_token")
    }
}
