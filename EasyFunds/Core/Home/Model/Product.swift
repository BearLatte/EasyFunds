//
//  Product.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/27.
//

import Foundation

struct Product : Decodable, Identifiable {
    /// id 标识符
    let id: String
    /// 产品 logo
    let productLogo : String
    
    /// 产品名称/
    let productName : String
    
    /// 借款天数
    let productDays : String
    
    /// 借款金额
    let productAmount : String
    
    /// 贷款费率
    let productRate : String
    
    /// 借款金额
    let loanAmount : String
    
    /// 借款天数
    let loanOfDays : String
    
    /// 到账金额
    let loanPayAmount : String
    
    let loanFeeVerify : String
    
    let loanFeeGst : String
    
    /// 利息
    let loanInterest : String
    
    /// 逾期费率
    let loanOverdue : String
    
    /// 应还金额
    let loanRepayAmount : String
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        productLogo = try values.decode(String.self, forKey: .productLogo)
        productName = try values.decode(String.self, forKey: .productName)
        productDays = try values.decode(String.self, forKey: .productDays)
        productAmount = try values.decode(String.self, forKey: .productAmount)
        productRate = try values.decode(String.self, forKey: .productRate)
        loanAmount = try values.decode(String.self, forKey: .loanAmount)
        loanOfDays = try values.decode(String.self, forKey: .loanOfDays)
        loanPayAmount = try values.decode(String.self, forKey: .loanPayAmount)
        loanFeeVerify = try values.decode(String.self, forKey: .loanFeeVerify)
        loanFeeGst = try values.decode(String.self, forKey: .loanFeeGst)
        loanInterest = try values.decode(String.self, forKey: .loanInterest)
        loanOverdue = try values.decode(String.self, forKey: .loanOverdue)
        loanRepayAmount = try values.decode(String.self, forKey: .loanRepayAmount)
    }
    
    enum CodingKeys : String, CodingKey {
        case id = "prcrxooductId"
        case productLogo = "prcrxooductLogo"
        case productName = "prcrxooductName"
        case productDays = "prcrxooductDays"
        case productAmount = "prcrxooductAmount"
        case productRate = "prcrxooductRate"
        case loanAmount = "lrcoxoanAmount"
        case loanOfDays = "lrcoxoanOfDays"
        case loanPayAmount = "lrcoxoanPayAmount"
        case loanFeeVerify = "lrcoxoanFeeVerify"
        case loanFeeGst = "lrcoxoanFeeGst"
        case loanInterest = "lrcoxoanInterest"
        case loanOverdue = "lrcoxoanOverdue"
        case loanRepayAmount = "lrcoxoanRepayAmount"
    }
}
