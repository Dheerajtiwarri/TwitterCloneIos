//
//  LoginView.swift
//  TwitterClone
//
//  Created by Dheeraj Tiwari on 26/06/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        //parent container
        VStack{
            //Header View
            AuthHeaderView(titleMain: "Hello", titleSub: "Welcome Back.")

            
            VStack(spacing: 40){
                CustomInputFields(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomInputFields(imageName: "lock", placeHolderText: "Password", text: $password)
                
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset Password view..")
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            
            Button{
                print("Sign in here...")
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}