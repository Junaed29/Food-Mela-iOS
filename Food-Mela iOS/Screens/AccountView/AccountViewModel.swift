//
//  AccountViewModel.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 20/3/23.
//

import SwiftUI


final class AccountViewModel: ObservableObject{
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthDate: Date = Date()
    @Published var napkins: Bool = false
    @Published var frequentRefels: Bool = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty  && !email.isEmpty else {
            alertItem = AlertContext.textFieldEmpty
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        
        
    }
}
