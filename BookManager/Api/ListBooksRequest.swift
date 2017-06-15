import Foundation
import APIKit
import Himotoki

struct ListBooksRequest: BaseRequest {

    typealias Response = BookCollection

    let userId: Int
    let page: String
    let token: String

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/books"
    }

    var headerFields: [String : String] {
        return ["Authorization": token]
    }

    var queryParameters: [String : Any]? {
        return ["user_id": userId, "page": page]
    }
}
