struct WeatherDay {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    init(day dayOfWeek: String, icon imageName: String, temp temperature: Int) {
        self.dayOfWeek = dayOfWeek
        self.imageName = imageName
        self.temperature = temperature
    }
}
