//
//  StringIntepolationView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/4/24.
//

import SwiftUI

struct StringInterpolationView: View {
    
    @State private var selectedCountry = Countries.ie
    @State private var selectedDate = Date()
    
    private let calendar = Calendar.current
    
    private let datesPrefix: [(offset: Int, description: String)] = [
        (-2, "Позавчера"),
        (-1, "Вчера"),
        (.zero, "Сегодня"),
        (1, "Завтра"),
        (2, "Послезавтра")
    ]
    
    var body: some View {
        VStack {
            Text("Выберите дату, затем выберите страну")
                .headline1()
                .multilineTextAlignment(.center)
                .bold()
                .padding()
            
            DatePicker("Выберите дату:",
                       selection: $selectedDate,
                       displayedComponents: .date)
            .environment(\.locale, selectedCountry.locales)
            .padding()
            
            Picker("", selection: $selectedCountry) {
                ForEach(Countries.allCases) { country in
                    Text(country.rawValue).tag(country)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            List {
                ForEach(datesPrefix, id: \.offset) { offset, description in
                    if let date = calendar.date(byAdding: .day, value: offset, to: selectedDate) {
                        Text("\(description): \(date: date, locale: selectedCountry.locales)")
                            .bold(description == "Сегодня")
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    StringInterpolationView()
}
