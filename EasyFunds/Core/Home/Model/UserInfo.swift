//
//  UserInfo.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/27.
//

import Foundation

struct UserInfo : Decodable {
    let userStatus: Int
    let auditPhone: String
    let photoContent: String
    let gpsContent: String
    let phoneContent: String
    let contactNum: String
    let userLiveness: Int
    let userPayFail: Int
    let payFailLogo: String
    let payFailContent: String
    let payFailLoanName: String
    let payFailLoanNo: String
    let thirdLiveness: String
    let productList: [Product]
    let loanProduct: Product
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userStatus = try container.decode(Int.self, forKey: .userStatus)
        self.auditPhone = try container.decode(String.self, forKey: .auditPhone)
        self.photoContent = try container.decode(String.self, forKey: .photoContent)
        self.gpsContent = try container.decode(String.self, forKey: .gpsContent)
        self.phoneContent = try container.decode(String.self, forKey: .phoneContent)
        self.contactNum = try container.decode(String.self, forKey: .contactNum)
        self.userLiveness = try container.decode(Int.self, forKey: .userLiveness)
        self.userPayFail = try container.decode(Int.self, forKey: .userPayFail)
        self.payFailLogo = try container.decode(String.self, forKey: .payFailLogo)
        self.payFailContent = try container.decode(String.self, forKey: .payFailContent)
        self.payFailLoanName = try container.decode(String.self, forKey: .payFailLoanName)
        self.payFailLoanNo = try container.decode(String.self, forKey: .payFailLoanNo)
        self.thirdLiveness = try container.decode(String.self, forKey: .thirdLiveness)
        self.productList = try container.decode([Product].self, forKey: .productList)
        self.loanProduct = try container.decode(Product.self, forKey: .loanProduct)
    }
    
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
}
