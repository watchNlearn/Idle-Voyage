//
//  IdleVoyageWidget.swift
//  IdleVoyageWidget
//
//  Created by Caleb Lee on 2/21/22.
//

import WidgetKit
import SwiftUI
import Intents
// says no such module error out of nowhere wtf?
//import Idle_Voyage

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        //UPDATED FROM 2/8/22
        SimpleEntry(startDate: 1644278400, ship: "🚀", date: Date(), background: LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading), configuration: ConfigurationIntent())
    }
    // UPDATED FROM project creation replace 2nd date: with 1646444916 to get jupiter -> phoebe ow constantly updating!
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(startDate: 1641168000, ship: "🚀", date: Date(), background: LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading), configuration: ConfigurationIntent())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let ud = UserDefaults(suiteName: "group.com.wal.IdleVoyage")
        let dateValue = ud?.value(forKey: "startDate")
        let shipString = ud?.value(forKey: "shipPref")
        
        // this is such a bad way of doing this but whatever
        
        var background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading)
        
        
        if configuration.background == .one {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading)
        }
        else  if configuration.background == .two {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topTrailing, endPoint: .bottomLeading)
        }
        else  if configuration.background == .three {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "f8bc04"), Color.init(hex: "101b39"),Color.init(hex: "101b39")]), startPoint: .bottomTrailing, endPoint: .topLeading)
        }
        else  if configuration.background == .four {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")]), startPoint: .topTrailing, endPoint: .leading)
        }
        else  if configuration.background == .five {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "1b1145"),Color.init(hex: "021f4b"), Color.init(hex: "8749bc"), Color.init(hex: "021f4b"),Color.init(hex: "1b1145")]), startPoint: .topLeading, endPoint: .bottom)
        }
        else  if configuration.background == .six {
            background = LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"),Color.init(hex: "100b1f"),Color.init(hex: "000000")]), startPoint: .trailing, endPoint: .topLeading)
        }
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        // WidgetKit is stupid .second works better than .minute cus second -> min and min -> hour....
        for minOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .second, value: minOffset, to: currentDate)!
            let entry = SimpleEntry(startDate: dateValue as! Double, ship: shipString as! String, date: entryDate, background: background, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
//        print("Timeline Entry Count: \(timeline.entries.count)")
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let startDate: Double
    let ship: String
    let date: Date
    let background: LinearGradient
    let configuration: ConfigurationIntent
}

// HELPERS


struct IdleVoyageWidgetEntryView : View {
    var entry: Provider.Entry
//    @State var progressValue: Float = 0.0
    let speedPerSecKm = AppConstants.Util.speedPerSecKm
    @Environment(\.widgetFamily) var family
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(entry: entry)
        case .systemMedium:
            MediumWidgetView(entry: entry)
        case .systemLarge:
            SmallWidgetView(entry: entry)
        case .systemExtraLarge:
            SmallWidgetView(entry: entry)
        @unknown default:
            SmallWidgetView(entry: entry)
        }
    }
}

@main
struct IdleVoyageWidget: Widget {
    let kind: String = "IdleVoyageWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            IdleVoyageWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Idle Voyage Widget")
        .description("Choose a background for your voyage!")
        .supportedFamilies([.systemSmall, .systemMedium])
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
    formatter.allowedUnits = [.year, .day, .hour, .minute]
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
// SMALL WIDGET
struct SmallWidgetView: View {
    var entry: Provider.Entry
    var body: some View {
        let speedPerSecKm = AppConstants.Util.speedPerSecKm

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
        
        VStack(alignment: .leading) {
            // stats + emoji
            HStack(alignment: .center) {
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
                    .padding(.leading, 2)

            }
            
            
            // Bottom planets + p bar
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                WidgetProgressBar(value: progressValue).frame(maxWidth: .infinity)
                    .frame(height: 10)
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .foregroundColor(.white)
        .padding()
        .background(entry.background)
        .overlay(
            Image(uiImage: entry.ship.image()!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 38)
                .frame(width: 38)
                .padding(.trailing, 8)
                .padding(.bottom, 30)
            , alignment: .trailing)
//        .onAppear {
//            print("Refreshed!")
//        }
    }
}

// MEDIUM WIDGET
struct MediumWidgetView: View {
    var entry: Provider.Entry
    var body: some View {
        let speedPerSecKm = AppConstants.Util.speedPerSecKm

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
        
        VStack(alignment: .leading) {
            // stats + emoji
            HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Distance")
                                    .font(.headline)
                                    .fixedSize()
                                Text(elapsedDistance.formatUsingAbbrevation() + " km")
                                    .font(Font.footnote.monospacedDigit())
                                    .opacity(0.7)
                                    .fixedSize()
                                Text("Leaving")
                                    .font(.headline)
                                    .fixedSize()
                                Text(lastSpaceObj.name)
                                    .font(.footnote)
                                    .opacity(0.7)
                                    .fixedSize()
                            }
                            .padding(.trailing, 30)
                            VStack(alignment: .leading) {
                                Text("Time")
                                    .font(.headline)
                                Text(getTimeString(interval: Int(totalElapsedTime)))
                                    .font(.footnote)
                                    .opacity(0.7)
                                    .fixedSize()
                                Text("Approaching")
                                    .font(.headline)
                                    .fixedSize()
                                Text(nextSpaceObj.name)
                                    .font(.footnote)
                                    .opacity(0.7)
                                    .fixedSize()
                            }
                        }
                        
                    }
                    .padding(.leading, 2)

            }
            // Bottom planets + p bar
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                WidgetProgressBar(value: progressValue).frame(maxWidth: .infinity)
                    .frame(height: 12)
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: elapsedDistance).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
                let num = Double(progressValue) * 100
                Text(String(num.rounded(toPlaces: 2)) + "%")
                    .font(Font.headline.monospacedDigit())
                    .foregroundColor(Color.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .foregroundColor(.white)
        .padding()
        .background(entry.background)
        .overlay(
            Image(uiImage: entry.ship.image()!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 38)
                .frame(width: 38)
                .padding(.trailing, 15)
                .padding(.bottom, 30)
            , alignment: .trailing)
//        .onAppear {
//            print("Refreshed!")
//        }
    }
}
