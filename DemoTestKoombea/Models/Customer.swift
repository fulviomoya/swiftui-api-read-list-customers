//
//  File.swift
//  DemoTestKoombea
//
//  Created by Fulvio A. Moya on 20/9/23.
//

import Foundation

struct Customer: Codable, Identifiable {
    var id: Int
    var firstName: String
    var email: String
    var pictureURL: String
}
