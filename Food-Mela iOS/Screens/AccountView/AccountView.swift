//
//  AccountView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel: AccountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email Name", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text(verbatim: "Save Changes")
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.napkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefels)
                        
                }.tint(Color.brandPrimary)
            }.navigationTitle("🤓 Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            viewModel.retreteUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
