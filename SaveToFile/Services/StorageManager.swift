//
//  StorageManager.swift
//  SaveToFile
//
//  Created by Yury on 7/3/23.
//

import Foundation

class StorageManager {
    
    // MARK: Properties
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let plistUrl: URL
    static var shared = StorageManager()
    
    // MARK: Init
    init() {
        self.plistUrl = documentDirectory.appendingPathComponent("Contact").appendingPathExtension("plist")
        print(plistUrl)
    }
    
    // MARK: Methods
    func saveToPlist(model: [Contact]) {
        let data = try? PropertyListEncoder().encode(model)
        try? data?.write(to: plistUrl)
    }
    
    func readFromPlist() -> [Contact] {
        guard let data = try? Data(contentsOf: plistUrl) else { return [] }
        guard let contacts = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
}
