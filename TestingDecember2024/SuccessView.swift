//
//  SuccessVIew.swift
//  TestingDecember2024
//
//  Created by Chris McGalliard on 12/9/23.
//

import SwiftUI

struct SuccessView: View {
    var resetAction: () -> Void

    var body: some View {
        VStack {
            Text("Welcome to the Success Page!")
                .padding()
            Button("Back to Login") {
                resetAction()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarTitle("Success")
    }
}


// Separate preview provider without resetAction
struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(resetAction: {})
    }
}
