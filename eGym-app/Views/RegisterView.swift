//
//  RegisterView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 9/1/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // Header (Logo Image)
            HeaderView(height: 150)
            
            // Register Form
            ZStack {
                VStack {
                    Text("Create an account")
                        .foregroundStyle(Color("GoldApp"))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .offset(y: -10)
                    
                    HStack {
                        TextField("",
                                  text: $viewModel.firstName,
                                  prompt: Text("Name")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.35)
                        .padding(.trailing, 10)
                        
                        TextField("",
                                  text: $viewModel.lastName,
                                  prompt: Text("Surnames")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))

                    }.frame(width: UIScreen.main.bounds.width * 0.90).padding(.bottom, 10)
                    
                    HStack {
                        //TODO: Each time the user enters a username, check if it is valid
                        TextField("",
                                  text: $viewModel.username,
                                  prompt: Text("Username")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.80)
                        
                        ZStack {
                            if viewModel.isUsernameLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            } else if viewModel.isUsernameEmpty {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.yellow)
                            } else {
                                if viewModel.isUsernameValid {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color("GoldApp"))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }.padding(.trailing, 8).opacity(viewModel.username.isEmpty ? 0 : 1).frame(width: UIScreen.main.bounds.width * 0.08)
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.90).padding(.bottom, 10)
                    
                    HStack {
                        //TODO: Each time the user enters an email, check if it is valid
                        TextField("",
                                  text: $viewModel.email,
                                  prompt: Text("Email (\("example@example.com"))")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.80)
                        
                        ZStack {
                            if viewModel.isEmailLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            } else {
                                if viewModel.isEmailValid {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color("GoldApp"))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }.padding(.trailing, 8).opacity(viewModel.email.isEmpty ? 0 : 1).frame(width: UIScreen.main.bounds.width * 0.08)
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.90).padding(.bottom, 10)
                    
                    HStack {
                        //TODO: Each time the user enters a password, check if it is valid
                        SecureField("",
                                    text: $viewModel.password,
                                  prompt: Text("Password (0-9, a-Z, ?-!)")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.80)
                        
                        ZStack {
                            if viewModel.isPasswordLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            } else {
                                if viewModel.isPasswordValid {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color("GoldApp"))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }.padding(.trailing, 8).opacity(viewModel.password.isEmpty ? 0 : 1).frame(width: UIScreen.main.bounds.width * 0.08)
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.90).padding(.bottom, 10)
                    
                    HStack {
                        //TODO: Check if the verify password matches password
                        SecureField("",
                                    text: $viewModel.verifyPassword,
                                  prompt: Text("Verify Password")
                            .foregroundColor(Color("BrokenWhiteApp"))
                        )
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .foregroundColor(Color("BrokenWhiteApp"))
                        .frame(width: UIScreen.main.bounds.width * 0.80)
                        
                        ZStack {
                            if viewModel.isVerifyPasswordLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            } else {
                                if viewModel.isVerifyPasswordValid {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color("GoldApp"))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }.padding(.trailing, 8).opacity(viewModel.verifyPassword.isEmpty ? 0 : 1).frame(width: UIScreen.main.bounds.width * 0.08)
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.90).padding(.bottom, 10)
                    
                    Text("Select Birth Date")
                        .foregroundStyle(Color("BrokenWhiteApp"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)

                    
                    DatePicker("", selection: $viewModel.birthDate, in: Calendar.current.date(byAdding: .year, value: -100, to: Date())!...Date(),  displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width * 0.90, height: 100, alignment: .center)
                        .clipped()
                        
                    Button(action: {
                        //TODO: Attempt register
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(Color("GoldApp"))
                            Text("Create Account")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }).frame(width: UIScreen.main.bounds.width * 0.90, height: 60)
                        .offset(y: 10)


                    
                }.textFieldStyle(WhiteBorder()).offset(y: -35)
            }
            
            Spacer()
        }.background(Color("BrownApp"))
    }
}

#Preview {
    RegisterView()
}
