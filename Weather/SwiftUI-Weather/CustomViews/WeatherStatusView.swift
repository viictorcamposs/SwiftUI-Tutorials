import SwiftUI

struct WeatherStatusView: View {
    var isNight: Bool
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .heavy))
                .foregroundStyle(.white)
        }

    }
}
