import Foundation
import APIKit
import Himotoki

struct AccountRequest: Base {

    typealias Response = Auth

    let email: String
    let password: String

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "/signup"
    }

    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "email": email,
            "password": password
        ])
    }
}
