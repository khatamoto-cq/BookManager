import Foundation
import APIKit
import Himotoki

protocol Base: Request {}

extension Base {
    var baseURL: URL {
        return URL(string: Const.BaseURL)!
    }
}

extension Base where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
