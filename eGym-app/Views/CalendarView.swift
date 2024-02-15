//
//  CalendarView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 27/1/24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var calendarViewModel = CalendarViewModel()
    @State var currentDate: Date = Date()
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(spacing: 20) {
                    CustomCalendarView(currentDate: $currentDate)
                }
                .frame(width: UIScreen.main.bounds.width * 0.85)
                .padding([.leading, .trailing, .top])
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("BrownApp-Light"))
                        .shadow(color: .black, radius: 8, x: 0, y: 3)
                )
                
                
                HStack {
                    Text("Calendar Routines").bold().foregroundStyle(Color("GoldApp")).padding(.leading, 20)
                    Spacer()
                }
                .padding(.top, 10)
                
                ForEach($calendarViewModel.routines, id: \.id) { $routine in
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Routine: \($routine.name.wrappedValue)").bold()
                                Spacer()
                                Text(formatDate(convertStringToDate($routine.date.wrappedValue)!)).bold()
                            }
                            Text("\(String($routine.exercises.count)) Exercises").font(.caption)
                            Text("\(String($routine.liftedWeight.wrappedValue))kg lifted").font(.caption)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.85)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("BrownApp-Light"))
                            .shadow(color: .black, radius: 8, x: 0, y: 3)
                    )
                }
            }
        }
        .background(Color("BrownApp"))
        .onAppear {
            Task {
                await calendarViewModel.getRoutines()
            }
        }
    }
    
    // Convert String date format to Date
    func convertStringToDate(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        return dateFormatter.date(from: dateString)
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
}

#Preview {
    CalendarView()
}
