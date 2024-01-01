//
//  Login.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI
import AuthenticationServices


struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header (Logo Image)
            HeaderView()
            
            // Login Form
            ZStack {
                VStack {
                    TextField("",
                              text: $email,
                              prompt: Text("Email Address")
                                        .foregroundColor(Color("BrokenWhiteApp"))
                    )
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                        .padding(10)

                        
                    SecureField("", 
                                text: $password,
                                prompt: Text("Password")
                                          .foregroundColor(Color("BrokenWhiteApp"))
                      )
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                    
                    
                    Text("Forgot your password?")
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .font.system(
                        .onTapGesture {
                            //TODO: Add restore password
                        }
                    
                    
                    Button(action: {
                        //TODO: Attempt log in
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(Color("GoldApp"))
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }).frame(width: UIScreen.main.bounds.width * 0.90, height: 60)
                        .offset(y: 10)
                }.textFieldStyle(WhiteBorder())
            }.offset(y: -25)
                
            // Create Account
            HStack {
                Text("Do not have an account? ")
                    .foregroundStyle(Color("BrokenWhiteApp"))
                Text("Create an account")
                    .foregroundStyle(Color("GoldApp"))
                    .fontWeight(.bold)
                    .onTapGesture { 
                        //TODO: Add Create account view
                    }
            }.offset(y: -15)
            
                
            
            // Other Login methods
            
            
            
            
            Spacer()
        }.background(Color(red: 34 / 255, green: 32 / 255, blue: 33 / 255))
    }
}

#Preview {
    LoginView()
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("eGym")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 300)
        }.offset(y: -20)
    }
}


// Structure creating a custom textFieldStyle
struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("BrokenWhiteApp"), lineWidth: 3)
            )
    }
}


