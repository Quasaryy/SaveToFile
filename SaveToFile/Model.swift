//
//  Contact.swift
//  SaveToFile
//
//  Created by Yury on 7/3/23.
//

struct Contact {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        "\(firstName)" + "\(lastName)"
    }
}
