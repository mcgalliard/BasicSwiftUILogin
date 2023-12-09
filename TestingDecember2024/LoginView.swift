//
//  LoginView.swift
//  TestingDecember2024
//
//  Created by Chris McGalliard on 12/9/23.
//

import SwiftUI

struct UserCredentials {
    let username: String
    let password: String
}

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isInitialState: Bool = true

    private let acceptableUserCredentials: [UserCredentials] = [
        UserCredentials(username: "YEP1", password: "YEP1"),
        UserCredentials(username: "YEP2", password: "YEP2"),
    ]

    func login() {
        if let matchedCredentials = acceptableUserCredentials.first(where: { $0.username == username && $0.password == password }) {
            isLoggedIn = true
            isInitialState = false
        } else {
            isLoggedIn = false
            isInitialState = false
        }
    }

    func reset() {
        username = ""
        password = ""
        isLoggedIn = false
        isInitialState = true
    }
}

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Login") {
                viewModel.login()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)

            if viewModel.isLoggedIn {
                Text("Login successful!")
                    .foregroundColor(.green)
            } else {
                Text("Invalid username or password.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
