//
//  PlistManager.swift
//  ExchangeApp
//
//  Created by Jiwon Yoon on 2023/05/07.
//

import Foundation

final class PlistManager {
    static let shared = PlistManager()

    func getValueFromPlist(plistName: String, key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: plistName, ofType: "plist") else {
            fatalError("Couldn't find file '\(plistName).plist'")
        }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: key) as? String else {
            fatalError("Couldn't find a key: \(key)")
        }

        return value
    }
}
