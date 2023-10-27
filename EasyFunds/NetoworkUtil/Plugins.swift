//
//  Plugins.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Moya
import UIKit
import Foundation


struct Plugins : PluginType {
    
    
    func willSend(_ request: RequestType, target: TargetType) {
        let curRequest = request.request
        let body = String(data: curRequest?.httpBody ?? Data(), encoding: .utf8) ?? ""
        debugLog("请求方式:\(curRequest?.httpMethod ?? ""), \nURL: \(curRequest?.url?.absoluteString ?? "")\n请求头:\(curRequest?.headers ?? [:])\n请求体:\(body)")
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            do {
                let successResponse = try? response.filterSuccessfulStatusCodes()
                let json = try? successResponse?.mapJSON()
                debugLog("请求返回值: \(json ?? "")")
            }
        case .failure(let error):
            debugLog("请求失败信息：\(error.localizedDescription)")
        }
    }
}

