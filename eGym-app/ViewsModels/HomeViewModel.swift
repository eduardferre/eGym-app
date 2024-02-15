//
//  HomeViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 5/2/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var listPosts: [PostModel] = []
    
    @Published var errorMsg = ""
    @Published var hasFailed = false
    
    func getPosts() async {
        await PostServices.shared.callGetPosts() { response in
            if let response = response {
                self.errorMsg = ""
                self.listPosts = response
            }
        } failure: { error in
            self.errorMsg = "Oops! There's a problem, sorry!"
            self.hasFailed = true
        }
    }
}
