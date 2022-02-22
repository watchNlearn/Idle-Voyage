//
//  IdleVoyageWidget.swift
//  IdleVoyageWidget
//
//  Created by Caleb Lee on 2/21/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(myStr: "hi", ship: "🚀", date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(myStr: "hi", ship: "🚀", date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let ud = UserDefaults(suiteName: "group.com.wal.IdleVoyage")
        let dateValue = ud?.value(forKey: "startDate")
        let shipString = ud?.value(forKey: "shipPref")

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(myStr: "\(String(describing: dateValue))", ship: shipString as! String, date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let myStr: String
    let ship: String
    let date: Date
    let configuration: ConfigurationIntent
}

struct IdleVoyageWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
        Text(entry.myStr)
        Text(entry.ship)

    }
}

@main
struct IdleVoyageWidget: Widget {
    let kind: String = "IdleVoyageWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            IdleVoyageWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

//struct IdleVoyageWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        IdleVoyageWidgetEntryView(entry: SimpleEntry(myStr: "test!", date: Date(), configuration: ConfigurationIntent()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
