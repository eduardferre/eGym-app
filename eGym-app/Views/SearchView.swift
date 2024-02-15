//
//  SearchView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI



struct SearchView: View {
    @StateObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    CustomTagView (alignment: .leading, spacing: 10) {
                        ForEach($searchViewModel.tags) { $tag in
                            Toggle(
                                tag.name, isOn: $tag.isSelected)
                            .bold()
                            .toggleStyle(.button).buttonStyle(.bordered).clipShape(Capsule())
                            .foregroundColor(tag.isSelected ? Color("GoldApp") : .primary)
                            .tint(tag.isSelected ? Color("GoldApp") : .black)
                        }
                    }.padding([.leading, .bottom], 45)
                    
                    Divider().overlay(Color("BrokenWhiteApp")).frame(minHeight: 3)
                    if (searchViewModel.nothingSelected) {
                        Text("Please select one or more tags to search")
                    } else if ((searchViewModel.user == nil && searchViewModel.exercise == nil && searchViewModel.routines.isEmpty)) {
                        Text("No matching information found")
                    } else {
                        if let user: UserModel = searchViewModel.user {
                            VStack {
                                HStack {
                                    Text("Users")
                                        .padding(.leading, 10)
                                        .bold()
                                        .foregroundStyle(Color("GoldApp"))
                                    Spacer()
                                }
                                
                                HStack {
                                    AsyncImage(
                                        url: URL(string: user.profilePicture),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 45, height: 45)
                                                .clipped()
                                                .clipShape(Circle())
                                        },
                                        placeholder: {
                                            Image("avatar")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 45, height: 45)
                                                .clipped()
                                                .clipShape(Circle())
                                        }
                                    ).padding(.leading, 10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(user.fullname).bold().font(.title2)
                                        Text("@\(user.username)").font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("\(String(user.followers.count)) followers").font(.caption)
                                        Text("\(String(user.following.count)) following").font(.caption)
                                    }.padding(.trailing, 15)
                                    
                                }
                                .frame(height: 60)
                                .background(Color("BrownApp-Dark"))
                                
                                Divider().overlay(Color("BrokenWhiteApp")).frame(minHeight: 3)
                            }
                            .offset(y: 20)
                        }
                        
                        if let exercise: ExerciseTOModel = searchViewModel.exercise {
                            VStack {
                                HStack {
                                    Text("Exercises")
                                        .padding(.leading, 10)
                                        .bold()
                                        .foregroundStyle(Color("GoldApp"))
                                    Spacer()
                                }
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(exercise.name.uppercased()).bold().font(.title3)
                                        Text("@\(exercise.creator)").font(.caption)
                                    }
                                    Spacer()
                                }
                                .padding(.leading, 20)
                                .frame(height: 60)
                                .background(Color("BrownApp-Dark"))
                                
                                Divider().overlay(Color("BrokenWhiteApp")).frame(minHeight: 3)
                            }
                            .offset(y: 20)
                        }
                        
                        if (!$searchViewModel.routines.isEmpty) {
                            VStack {
                                HStack {
                                    Text("Routines")
                                        .padding(.leading, 10)
                                        .bold()
                                        .foregroundStyle(Color("GoldApp"))
                                    Spacer()
                                }
                                
                                ForEach($searchViewModel.routines, id: \.id) { $routine in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text($routine.name.wrappedValue.uppercased()).bold().font(.title3)
                                            Text("@\($routine.creator.wrappedValue)").font(.caption)
                                        }
                                        Spacer()
                                        
                                        Text("\(String($routine.exercises.count)) Exercices")
                                            .padding(.trailing, 15)
                                    }
                                    .padding(.leading, 20)
                                    .frame(height: 60)
                                    .background(Color("BrownApp-Dark"))
                                    
                                    Divider().overlay(Color("BrokenWhiteApp")).frame(minHeight: 3)
                                }
                            }
                            .offset(y: 20)
                        }                    }
                }
            }
            .background(Color("BrownApp"))
            .searchable(text: $searchViewModel.searchText, prompt: "Look for something")
            .autocorrectionDisabled()
            .autocapitalization(.none)
            .onReceive(
                searchViewModel.$searchText
                    .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            ) {
                guard !$0.isEmpty else { return }
                print(">> searching for: \($0)")
                Task {
                    await searchViewModel.delay()
                }
            }
        }
    }
    
    
}

#Preview {
    SearchView()
}
