import Foundation
import APIKit
import Himotoki

struct AddBookRequest: BaseRequest {
    typealias Response = ResisterBookResponse

    let name: String
    let price: Int
    let purchaseDate: String
    let imageData: String
    let userId: Int
    let token: String

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "/books"
    }

    var headerFields: [String : String] {
        return ["Authorization": token]
    }

    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "name": name,
            "price": price,
            "purchase_date": purchaseDate,
            "image_data": imageData,
            "user_id": userId
        ])
    }
}
