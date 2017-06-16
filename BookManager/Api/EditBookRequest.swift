import Foundation
import APIKit
import Himotoki

struct EditBookRequest: BaseRequest {
    typealias Response = BookResult

    let id: Int
    let name: String
    let price: Int
    let purchaseDate: String
    let imageData: String
    let token: String

    var method: HTTPMethod {
        return .patch
    }

    var path: String {
        return String(format: "/books/%@", String(self.id))
    }

    var headerFields: [String : String] {
        return ["Authorization": token]
    }

    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "name": name,
            "price": price,
            "purchase_date": purchaseDate,
            "image_data": imageData
        ])
    }
}
