//
//  User.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 21/3/23.
//

import Foundation

struct User: Codable {
    var firstName:      String  = ""
    var lastName:       String  = ""
    var email:          String  = ""
    var birthDate:      Date    = Date()
    var napkins:        Bool    = false
    var frequentRefels: Bool    = false
}
