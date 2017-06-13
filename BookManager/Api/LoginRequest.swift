import Foundation
import APIKit
import Himotoki

struct LoginRequest: Base {
    typealias Response = Auth

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

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
