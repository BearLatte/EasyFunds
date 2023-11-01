//
//  APPError.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/30.
//

import Foundation


struct APPError : Error {
    var desc = ""
    var errorDescription : String { desc }
    
    init(_ desc: String) {
        self.desc = desc
    }
}
