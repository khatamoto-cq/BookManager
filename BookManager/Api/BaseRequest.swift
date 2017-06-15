import Foundation
import APIKit
import Himotoki

protocol BaseRequest: Request {}

extension BaseRequest {
    var baseURL: URL {
        return URL(string: Const.BaseURL)!
    }
}

extension BaseRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
