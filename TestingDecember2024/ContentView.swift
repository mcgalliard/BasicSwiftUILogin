//
//  ContentView.swift
//  TestingDecember2024
//
//  Created by Chris McGalliard on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
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
                .disabled(viewModel.isLoggedIn)

                NavigationLink(
                    destination: SuccessView(resetAction: viewModel.reset),
                    isActive: $viewModel.isLoggedIn,
                    label: {
                        EmptyView()
                    }
                )
                .isDetailLink(false)

                if viewModel.isInitialState {
                    Text("Enter credentials")
                        .foregroundColor(.blue)
                } else if viewModel.isLoggedIn {
                    Text("Login successful!")
                        .foregroundColor(.green)
                } else {
                    Text("Invalid username or password.")
                        .foregroundColor(.red)
                }
            }
            .padding()
            .navigationBarTitle("Login Page")
            .onAppear {
                viewModel.reset()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

