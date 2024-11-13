//
//  Landing.swift
//  RestMap
//
//  Created by Elliott Griffin on 11/11/24.
//

import SwiftUI

struct LandingView: View {
    @State private var isShowingLogin = false
    @State private var isShowingSignUp = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Welcome to RestMap")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Find and rate accessible public toilets near you.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Button(action: {
                    isShowingLogin = true
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isShowingLogin) {
                    LoginView { isShowingLogin = false }
                }
                
                Button(action: {
                    isShowingSignUp = true
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isShowingSignUp) {
                    SignUpView { isShowingSignUp = false }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LandingView()
}

