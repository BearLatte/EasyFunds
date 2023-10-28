//
//  UserInfo.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/27.
//

import Foundation

struct UserInfo : Decodable {
    let userStatus: Int?
    let auditPhone: String?
    let photoContent: String?
    let gpsContent: String?
    let phoneContent: String?
    let contactNum: Int?
    let userLiveness: Int?
    let userPayFail: Int?
    let payFailLogo: String?
    let payFailContent: String?
    let payFailLoanName: String?
    let payFailLoanNo: String?
    let thirdLiveness: String?
    let productList: [Product]?
    let loanProduct: Product?
    
    
    
    enum CodingKeys : String, CodingKey {
        case userStatus = "urcsxoerStatus"
        case auditPhone = "arcuxoditPhone"
        case photoContent = "prchxootoContent"
        case gpsContent = "grcpxosContent"
        case phoneContent = "prchxooneContent"
        case contactNum = "crcoxontactNum"
        case userLiveness = "urcsxoerLiveness"
        case userPayFail = "urcsxoerPayFail"
        case payFailLogo = "prcaxoyFailLogo"
        case payFailContent = "prcaxoyFailContent"
        case payFailLoanName = "prcaxoyFailLoanName"
        case payFailLoanNo = "prcaxoyFailLoanNo"
        case thirdLiveness = "trchxoirdLiveness"
        case productList = "prcrxooductList"
        case loanProduct = "lrcoxoanProduct"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userStatus = try values.decodeIfPresent(Int.self, forKey: .userStatus)
        auditPhone = try values.decodeIfPresent(String.self, forKey: .auditPhone)
        photoContent = try values.decodeIfPresent(String.self, forKey: .photoContent)
        gpsContent = try values.decodeIfPresent(String.self, forKey: .gpsContent)
        phoneContent = try values.decodeIfPresent(String.self, forKey: .phoneContent)
        contactNum = try values.decodeIfPresent(Int.self, forKey: .contactNum)
        userLiveness = try values.decodeIfPresent(Int.self, forKey: .userLiveness)
        userPayFail = try values.decodeIfPresent(Int.self, forKey: .userPayFail)
        payFailLogo = try values.decodeIfPresent(String.self, forKey: .payFailLogo)
        payFailContent = try values.decodeIfPresent(String.self, forKey: .payFailContent)
        payFailLoanName = try values.decodeIfPresent(String.self, forKey: .payFailLoanName)
        payFailLoanNo = try values.decodeIfPresent(String.self, forKey: .payFailLoanNo)
        thirdLiveness = try values.decodeIfPresent(String.self, forKey: .thirdLiveness)
        productList = try values.decodeIfPresent([Product].self, forKey: .productList)
        loanProduct = try values.decodeIfPresent(Product.self, forKey: .loanProduct)
    }
}
