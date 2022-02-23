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
        SimpleEntry(startDate: 103934, ship: "🚀", date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(startDate: 103934, ship: "🚀", date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let ud = UserDefaults(suiteName: "group.com.wal.IdleVoyage")
        let dateValue = ud?.value(forKey: "startDate")
        let shipString = ud?.value(forKey: "shipPref")

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for minOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .second, value: minOffset, to: currentDate)!
            let entry = SimpleEntry(startDate: dateValue as! Double, ship: shipString as! String, date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let startDate: Double
    let ship: String
    let date: Date
    let configuration: ConfigurationIntent
}

// HELPERS


struct IdleVoyageWidgetEntryView : View {
    var entry: Provider.Entry
//    @State var progressValue: Float = 0.0
    let speedPerSecKm = 194.444444443

    var body: some View {
        //        Text(entry.date, style: .time)
        //        Text(entry.myStr)
        //        Text(entry.ship)
        let startDateInSec = entry.startDate
        let currentDate = Date().timeIntervalSince1970
        let totalElapsedTime = currentDate - startDateInSec
        let elapsedDistance = speedPerSecKm * totalElapsedTime
        
        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance)
        let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance)
        
        let distanceRemaining = nextSpaceObj.distanceInKm - elapsedDistance
        
        let progress = 1 - (distanceRemaining/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
        
        let progressValue = Float(progress)
        
        VStack {
            // stats + emoji
            HStack(alignment: .center) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .font(.headline)
                            .fixedSize()
                        Text(elapsedDistance.formatUsingAbbrevation() + " km")
                            .font(Font.footnote.monospacedDigit())
                            .opacity(0.7)
                            .fixedSize()
                        Text("Time")
                            .font(.headline)
                        Text(getTimeString(interval: Int(totalElapsedTime)))
                            .font(.footnote)
                            .opacity(0.7)
                            .fixedSize()
                        Text("Approach")
                            .font(.headline)
                            .fixedSize()
                        Text(nextSpaceObj.name)
                            .font(.footnote)
                            .opacity(0.7)
                            .fixedSize()
                    }
                    VStack(alignment: .trailing) {
                        Image(uiImage: entry.ship.image()!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 38)
                            .frame(width: 38)
                            .padding(2)
                    }
                }
            }
            
            // Bottom planets + p bar
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 22)
                WidgetProgressBar(value: progressValue).frame(maxWidth: .infinity)
                    .frame(height: 10)
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 22)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading))
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

func getTimeString(interval: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute]
    formatter.unitsStyle = .abbreviated

    let formattedString = formatter.string(from: TimeInterval(interval))!
    return formattedString
}

struct WidgetProgressBar: View {
    var value: Float
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.orange))
                    
                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.green))
                        .animation(.linear)
                }.cornerRadius(4)
            }
        }
}

