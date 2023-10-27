//
//  APIClient.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation
import Moya
import UIKit

let netProvider = MoyaProvider<API>(plugins: [Plugins()])

enum API {
    case firstLaunch
    case unloginHome
}

extension API : TargetType {
    var baseURL: URL {
#if DEBUG
        return URL(string: "http://149.129.217.31:1360")!
#else
        return URL(string: "")!
#endif
    }
    
    var path: String {
        switch self {
        case .firstLaunch:
            return "/HsEnIz/PBYBdj"
        case .unloginHome:
            return "/HsEnIz/SHbdg"
            
        }
    }
    
    var method: Moya.Method { .post }
    
    var task: Moya.Task {
        var params : [String:Any] = [:]
        switch self {
        case .firstLaunch, .unloginHome: break
        }
        return .requestParameters(parameters: configParameters(oldParams: params), encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        let deviceInfo : [String : Any] = [
            "mac": "",
            "brand": "Apple",
            "operationSys": "iOS",
            "channel": "App Store",
            "gaidOrIdfa": Global.idfa ?? "",
            "deviceModel": UIDevice.modelName,
            "bag": Bundle.main.bundleIdentifier!,
            "androidIdOrUdid": UIDevice.uuid ?? "",
            "osVersion": UIDevice.current.systemVersion,
            "appVersion" : Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")!
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: deviceInfo, options: JSONSerialization.WritingOptions(rawValue: 0))
        let deviceInfoStr = String(data: jsonData!, encoding: .utf8) ?? ""
        return ["lang": "es", "token": Global.accessToken ?? "", "deviceInfo" : deviceInfoStr]
    }
    
    private func configParameters(oldParams : [String : Any]?) -> [String : Any] {
        var newParams = oldParams ?? [:]
        let randomKey = String.randomString(with: 30)
        newParams["nOOonOcestr"] = randomKey
        var secretKey : String
#if DEBUG
        secretKey = String.sortedDictionary(with: newParams) + "&" + "signKey=iYeXsbQTefsNWaAyFSDRBnkb"
#else
        secretKey = String.sortedDictionary(with: params) + "&" + ""
#endif
        newParams["rOOeqOSign"] = secretKey.md5.uppercased()
        return newParams
    }
    
}
