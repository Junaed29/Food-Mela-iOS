//
//  AccountViewModel.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 20/3/23.
//

import SwiftUI


final class AccountViewModel: ObservableObject{
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("USER") private var storagedUserData: Data?
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty  && !user.email.isEmpty else {
            alertItem = AlertContext.textFieldEmpty
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            storagedUserData = data
            alertItem = AlertContext.userDataSavedSuccess
        }catch{
            alertItem = AlertContext.userDataSavedFailed
        }
    }
    
    func retreteUser(){
        guard let storagedUserData = storagedUserData else{return}
        
        do {
            let userData = try JSONDecoder().decode(User.self, from: storagedUserData)
            user = userData
        }catch{}
    }
}
