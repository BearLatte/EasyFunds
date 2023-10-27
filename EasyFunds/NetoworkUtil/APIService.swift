//
//  APIService.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/27.
//

import Foundation

struct APIService {
    // 启动时的第一个网络请求
    static func firstRequest() async  {
        return await withCheckedContinuation { continuation in
            netProvider.request(.firstLaunch) { result in
                continuation.resume()
            }
        }
    }
    
    // 登录前首页
    static func fetchHomeData() async throws -> UserInfo {
        let userInfo : UserInfo = try await baseRequest(api: .unloginHome)
        return userInfo
    }
    
    static func baseRequest<T: Decodable>(api: API) async throws -> T {
        await withCheckedContinuation { continuation in
            netProvider.request(api) { result in
                switch result {
                case let .success(respons):
                    guard var res = try? respons.mapJSON() as? [String : Any],
                          let status = res["rrcexosultCode"] as? Int,
                          let message = res["rrcexosultMsg"] as? String else {
                        return
                    }
                    res.removeValue(forKey: "rrcexosultCode")
                    res.removeValue(forKey: "rrcexosultMsg")
                    let newJson : [String : Any]  = ["status": status, "message" : message, "data" : res]
                    
                    guard let responseData =  try? JSONSerialization.data(withJSONObject: newJson)
                          else {
                        return
                    }
                    debugLog(newJson)
                    let baseResponse = try? JSONSerialization.jsonObject(with: responseData)
                    debugLog(baseResponse)
//                    continuation.resume(returning: baseResponse!.data!)
                case let .failure(error):
                    debugLog("请求发生错误: \(error.localizedDescription)")
                }
            }
        }
    }
}
