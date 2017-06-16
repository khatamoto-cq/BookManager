import Foundation
import APIKit
import Himotoki

struct LoginRequest: BaseRequest {
    typealias Response = AccountResponse

    let email: String
    let password: String

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "/login"
    }

    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "email": email,
            "password": password
        ])
    }
}
