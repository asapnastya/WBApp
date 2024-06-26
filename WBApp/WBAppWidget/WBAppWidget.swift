//
//  WBAppWidget.swift
//  WBAppWidget
//
//  Created by Анастасия Романова on 6/25/24.
//

import WidgetKit
import SwiftUI

// MARK: - FavouriteContactEntry
struct FavouriteContactEntry: TimelineEntry {
    
    let date: Date
    let contact: ContactView_Model?
}

// MARK: - WBAppWidget
struct WBAppWidget: Widget {
    
    let kind: String = "WBAppWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()
        ) { entry in
            WBAppWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}

// MARK: - Provider
struct Provider: AppIntentTimelineProvider {
    
    private var contact: ContactView_Model? {
        guard let userDefaults = UserDefaults(suiteName: .appGroupIdentifier),
              let data = userDefaults.data(forKey: .firstContactKey)
        else { return nil }
        
        do {
            let decoder = JSONDecoder()
            let contact = try decoder.decode(ContactView_Model.self, from: data)
            return contact
        } catch {
            return nil
        }
    }
    
    func placeholder(in context: Context) -> FavouriteContactEntry {
        FavouriteContactEntry(
            date: Date(),
            contact: ContactView_Model(
                id: 1,
                name: "Анастасия Иванова",
                status: "Last seen yesterday",
                profileImage: "img_anastasiia_ivanova",
                phoneNumber: "+7 999 999-99-99"
            )
        )
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> FavouriteContactEntry {
        FavouriteContactEntry(
            date: Date(),
            contact: contact
        )
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<FavouriteContactEntry> {
        var entries: [FavouriteContactEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate) ?? Date()
            let entry = FavouriteContactEntry(
                date: entryDate,
                contact: contact
            )
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

// MARK: - Preview
#Preview(as: .systemMedium) {
    WBAppWidget()
} timeline: {
    FavouriteContactEntry(
        date: .now,
        contact: ContactView_Model.init(
            id: 1,
            name: "Анастасия Иванова",
            status: "Last seen yesterday",
            profileImage: "img_anastasiia_ivanova",
            phoneNumber: "+7 999 999-99-99")
    )
}
