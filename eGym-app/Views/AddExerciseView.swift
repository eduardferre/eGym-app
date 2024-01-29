//
//  AddExerciseView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import SwiftUI

struct AddExerciseView: View {
    @StateObject var addExerciseViewModel = AddExerciseViewModel()
    
    var body: some View {
        VStack {
            TextField("",
                      text: $addExerciseViewModel.exerciseName,
                      prompt: Text("Exercise Name")
                .foregroundColor(Color("BrokenWhiteApp"))
            )
            .autocapitalization(.sentences)
            .autocorrectionDisabled()
            .foregroundColor(Color("BrokenWhiteApp"))
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .padding(.bottom, 10)
            
            TextField("",
                      text: $addExerciseViewModel.exerciseDescription,
                      prompt: Text("Exercise Description")
                        .foregroundColor(Color("BrokenWhiteApp")),
                      axis: .vertical
            )
            .lineLimit(4...)
            .autocapitalization(.sentences)
            .autocorrectionDisabled()
            .foregroundColor(Color("BrokenWhiteApp"))
            .frame(width: UIScreen.main.bounds.width * 0.90)
        }.textFieldStyle(WhiteBorder())
    }
}

#Preview {
    AddExerciseView()
}
