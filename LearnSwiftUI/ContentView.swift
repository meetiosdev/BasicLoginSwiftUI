//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by Swarajmeet Singh on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var userName : String = String()
    @State private var userPassword : String = String()
    
    @State private var isLoginEnabled = false
    var body: some View {
        VStack {
            
            Text("Login").font(.largeTitle).padding()
            Text("Learn Swift UI with SwarajMeet iOS Dev").font(.subheadline).padding()
            TextField("Enter Username",text: $userName)
                .textFieldStyle(CustomTextFieldStyle())
                .onChange(of: userPassword) { newValue in
                    validateLogin()
                }
            SecureField("Enter Password", text: $userPassword)
                .textFieldStyle(CustomTextFieldStyle())
                .onChange(of: userPassword) { newValue in
                    validateLogin()
                }
            HStack{
                Button {
                    print("Login tapped")
                } label: {
                    Text("Login")
                }.disabled(!isLoginEnabled)
                Spacer()
                Button {
                    print("Forgot tapped")
                } label: {
                    Text("Forgot Password")
                }

            }.padding()
            
        }
        .padding()
    }
    
    
    func validateLogin() {
           isLoginEnabled = !userName.isEmpty && !userPassword.isEmpty && isUsernameValid() && isPasswordValid()
       }
       
       func isUsernameValid() -> Bool {
           // Add your username validation logic here
           // Return true if the username is valid, otherwise return false
           let components = userName.components(separatedBy: " ")
           if components.count >= 2 {
               let firstName = components[0]
               let lastName = components[1]
               return firstName.count >= 3 && lastName.count >= 3
           }
           return false
       }
       
       func isPasswordValid() -> Bool {
           // Add your password validation logic here
           // Return true if the password is valid, otherwise return false
           return userPassword.count >= 8
       }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .foregroundColor(.black) // set the text color
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal)
            .keyboardType(.default)
    }
}
