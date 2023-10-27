//
//  BaseResponse.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation

struct BaseResponse<T: Decodable> : Decodable, CustomStringConvertible {
    
    var data     : T?
    let status   : Int
    let message  : String?
    
    enum CodingKeys : String, CodingKey {
        case status = "status"
        case message = "message"
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }
    
    var description: String {
        return "{status: \(status), message: \(String(describing: message)), data: \(String(describing: data))}"
    }
}
