//
//  Contact.swift
//  SwiftDataCloudApp
//
//  Created by Никита Гуляев on 03.09.2024.
//

import SwiftData
import Foundation

@Model
class Contact: Identifiable {
    @Attribute var id: UUID = UUID()
    var name: String
    var phoneNumber: String
    var email: String
    var createdAt: Date

    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.createdAt = Date()
    }
}
