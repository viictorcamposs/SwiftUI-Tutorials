import SwiftUI

struct ContentView: View {
    @State private var isNightMode = false
    
    let weatherDayList: [WeatherDay] = [
        WeatherDay(day: "TUE", icon: "cloud.sun.fill", temp: 76),
        WeatherDay(day: "WED", icon: "sun.max.fill", temp: 88),
        WeatherDay(day: "THU", icon: "wind", temp: 55),
        WeatherDay(day: "FRI", icon: "sunset.fill", temp: 60),
        WeatherDay(day: "SAT", icon: "snow", temp: 25),
    ]
    
    var body: some View {
        ZStack {
            BgGradientView(isNight: isNightMode)
            
            VStack(spacing: 40) {
                CityTextView(cityName: "Cupertino, CA")
                
                WeatherStatusView(
                    isNight: isNightMode,
                    temperature: 76
                )
                
                HStack(spacing: 24) {
                    ForEach(weatherDayList, id: \.dayOfWeek) {
                        WeatherDayView(weatherDay: $0)
                    }
                }
                
                Spacer()
                
                Button {
                    isNightMode.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        bgColor: .white,
                        textColor: .blue
                    )
                }
                
                Spacer()
            }
        }
    }
}



#Preview {
    ContentView()
}
