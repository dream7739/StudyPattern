

//프로토콜을 정의하는 파일

import Foundation


//View protocol
protocol TrafficLightViewProtocol : class {
    func displayTrafficLight(description: String)
}


//Presenter Protocl
protocol TrafficLightPresenterProtocol : class {
    func trafficLightColorSelected(_ colorName:(String))
}


//Model protocol
protocol TrafficLightModelProtocol : class{
    func getTrafficLight(_ colorName: (String)) -> TrafficLight!
}
