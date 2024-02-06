//
//  HomeViewModel.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 5/2/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    func logout() {
        Auth.shared.logout()
    }
    
}
