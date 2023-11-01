//
//  String+Extension.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation
import CommonCrypto

extension String {
    var md5: String {
        let data = Data((self).utf8)
            let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
                var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
                CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
                return hash
            }
            return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    /// generate a random string
    static func randomString(with count: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var ranStr = ""
        for _ in 0 ..< count {
            let index = Int(arc4random()) % characters.count
            let nsstr = characters as NSString
            ranStr.append(nsstr.substring(with: NSRange(location: index, length: 1)))
        }
        return ranStr
    }
    
    var isBlank : Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    static func sortedDictionary(with parameters: Dictionary<String, Any?>) -> String {
        var paramsStr = ""
        let keys = parameters.keys.sorted()
        for index in 0 ..< keys.count {
            let key = keys[index] as String
            if let value = parameters[key] as? String, !value.isBlank {
                if index != keys.count - 1 {
                    paramsStr += String(format: "%@=%@&", key, String(value))
                } else {
                    paramsStr += String(format: "%@=%@", key, String(value))
                }
            }
            
        }
        return paramsStr
    }
    
    
    static func randomScore() -> String {
        let allScores = ["4.8", "4.9", "5.0"]
        let index =  Int(arc4random()) % allScores.count
        return allScores[index]
    }
}
