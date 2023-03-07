//
//  Contact.swift
//  SaveToFile
//
//  Created by Yury on 7/3/23.
//

struct Contact: Codable {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
