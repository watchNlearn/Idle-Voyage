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

// HELPERS


struct IdleVoyageWidgetEntryView : View {
    var entry: Provider.Entry
    @State var progressValue: Float = 0.67
    let distanceInKm = 1433600000 // this is saturns from the sun!
    
    var body: some View {
        //        Text(entry.date, style: .time)
        //        Text(entry.myStr)
        //        Text(entry.ship)
        VStack {
            // stats + emoji
            HStack(alignment: .center) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .font(.headline)
                            .fixedSize()
                        Text(distanceInKm.abbreviateNumber() + " km")
                            .font(.footnote)
                            .opacity(0.7)
                         
                            .fixedSize()
                        Text("Time")
                            .font(.headline)
                        Text(getTimeString(interval: 44448283))
                            .font(.footnote)
                            .opacity(0.7)
                            .fixedSize()
                        Text("Approach")
                            .font(.headline)
                            .fixedSize()
                        Text("Saturn")
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
                Image(uiImage: UIImage(named: "Mercury")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 22)
                WidgetProgressBar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 10)
                Image(uiImage: "🪐".image()!)
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
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
extension String {
    func image(fontSize:CGFloat = 60, bgColor:UIColor = UIColor.clear, imageSize:CGSize? = nil) -> UIImage?
    {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let imageSize = imageSize ?? self.size(withAttributes: attributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        bgColor.set()
        let rect = CGRect(origin: .zero, size: imageSize)
        UIRectFill(rect)
        self.draw(in: rect, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
func getTimeString(interval: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute]
    formatter.unitsStyle = .abbreviated

    let formattedString = formatter.string(from: TimeInterval(interval))!
    return formattedString
}

struct WidgetProgressBar: View {
    @Binding var value: Float
        
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
extension Int {
    func abbreviateNumber() -> String {
        if self < 1000 {
            return "\(self)"
        }

        if self < 1000000 {
            var n = Double(self);
            n = Double( floor(n/100)/100 )
            return "\(n.description)K"
        }

        var n = Double(self)
        n = Double( floor(n/100000)/100 )
        return "\(n.description)M"
    }
}
