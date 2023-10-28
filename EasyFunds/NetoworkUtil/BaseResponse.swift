//
//  BaseResponse.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation

struct BaseResponse<T: Decodable> : Decodable, CustomStringConvertible {
    
    let data     : T?
    let message  : String
    let statusCode   : Int
    
    enum CodingKeys : String, CodingKey {
        case statusCode = "statusCode"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try container.decode(Int.self, forKey: .statusCode)
        message = try container.decode(String.self, forKey: .message)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }
    
    var description: String {
        return "{status: \(statusCode), message: \(String(describing: message)), data: \(String(describing: data))}"
    }
}
