//
//  LoginView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var viewModel = AuthViewModel()
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                viewModel.signIn(email: email, password: password) { result in
                    switch result {
                    case .success(_):
                        // Перейти к следующему экрану
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            Button(action: {
                viewModel.register(email: email, password: password) { result in
                    switch result {
                    case .success(_):
                        // Перейти к следующему экрану
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

