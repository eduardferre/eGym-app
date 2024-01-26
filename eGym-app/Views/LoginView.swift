//
//  Login.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 30/12/23.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header (Logo Image)
                HeaderView(height: 300)
                
                Text("Welcome back warrior!")
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(Color("GoldApp"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(y: -30)
                
                // Login Form
                ZStack {
                    VStack {
                        TextField("",
                                  text: $loginViewModel.username,
                                  prompt: Text("Username")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        ).onSubmit() {
                            loginViewModel.validate()
                        }
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                        .padding(10)
                        
                        SecureField("",
                                    text: $loginViewModel.password,
                                    prompt: Text("Password")
                                              .foregroundColor(Color("BrokenWhiteApp"))
                          ).onSubmit() {
                            loginViewModel.validate()
                        }
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                        
                        
                        Text("Forgot your password?")
                            .foregroundColor(Color("GoldApp"))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                            .onTapGesture {
                                //TODO: Add restore password
                            }.padding(.bottom, 25).padding(.top, 5)
                    
                        
                        Button(action: {
                                let createLoginRequest = CreateLoginRequest(grant_type: "password", username: loginViewModel.username, password: loginViewModel.password, scope: nil, client_id: nil, client_secret: nil)

                                Task {
                                    await loginViewModel.createLogin(request: createLoginRequest)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        loginViewModel.setHasFailedFalse()
                                    }
                                }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .foregroundColor(Color("GoldApp"))
                                Text("Log In")
                                    .foregroundColor(Color.white)
                                    .bold()
                            }
                        }).toast(isPresenting: $loginViewModel.hasFailed) {
                            AlertToast(displayMode: .hud, type: .error(Color.red), title: $loginViewModel.errorMsg.wrappedValue)
                        }
                            .disabled($loginViewModel.isDisabled.wrappedValue)
                            .frame(width: UIScreen.main.bounds.width * 0.90, height: 60)
                            .offset(y: 10)
                    }.textFieldStyle(WhiteBorder())
                        .zIndex(2)
                }.offset(y: -25).ignoresSafeArea(.all).padding(.bottom, 10)
                    
                // Create Account
                HStack {
                    Text("Do not have an account?")
                        .foregroundStyle(Color("BrokenWhiteApp"))
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create an account")
                            .foregroundStyle(Color("GoldApp"))
                            .fontWeight(.bold)
                    }
                }.offset(y: -10)
                
                    
                
                // Other Login methods
                
                
                Spacer()
                
                Text("©eSolutions - Eduard Ferré Sánchez")
                    .font(.system(size:10))
                    .foregroundStyle(Color("GoldApp"))
            }.background(Color("BrownApp"))
        }
    }
}

#Preview {
    LoginView()
}

struct HeaderView: View {
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Image("eGym")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: height)
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
