//
//  Log+Extension.swift
//  EasyFunds
//
//  Created by Tim Guo on 2023/10/26.
//

import Foundation


/// debug environment log
/// - Parameters:
///   - file: file name
///   - fn: function name
///   - line: line number
///   - message: content
func debugLog<T>(file: NSString = #file, fn: String = #function, line: Int = #line, _ message: T) {
    #if DEBUG
    print("---------------------------------------------------------------------------------------------------")
    let prefix = "行号: \(line)\n文件名: \(file.lastPathComponent)\n方法名: \(fn)\n"
    print(prefix, message)
    print("---------------------------------------------------------------------------------------------------\n")
    #endif
}
