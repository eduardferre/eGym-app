//
//  AddRoutineView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 28/1/24.
//

import SwiftUI


struct AddRoutineView: View {
    @StateObject var addRoutineViewModel = AddRoutineViewModel()
    
    var body: some View {
        VStack {
            TextField("",
                      text: $addRoutineViewModel.routineName,
                      prompt: Text("Routine Name")
                .foregroundColor(Color("BrokenWhiteApp"))
            )
            .autocapitalization(.sentences)
            .autocorrectionDisabled()
            .foregroundColor(Color("BrokenWhiteApp"))
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .padding(.bottom, 10)
            
            TextField("",
                      text: $addRoutineViewModel.routineDescription,
                      prompt: Text("Routine Description")
                        .foregroundColor(Color("BrokenWhiteApp")),
                      axis: .vertical
            )
            .lineLimit(4...)
            .autocapitalization(.sentences)
            .autocorrectionDisabled()
            .foregroundColor(Color("BrokenWhiteApp"))
            .frame(width: UIScreen.main.bounds.width * 0.90)
        }
        .textFieldStyle(WhiteBorder())
    }
}

#Preview {
    AddRoutineView()
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
