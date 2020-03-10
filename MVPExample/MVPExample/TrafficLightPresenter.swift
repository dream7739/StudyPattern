//
//  TrafficLightPresenter.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

class TrafficLightPresenter: TrafficLightPresenterProtocol {
    private weak var view : TrafficLightViewProtocol!
    
    private var model = TrafficLightModel()
    
    init(view: TrafficLightViewProtocol) {
        self.view = view
    }
    
    func trafficLightColorSelected(_ colorName:(String)){
        let light = model.getTrafficLight(colorName)
        self.view.displayTrafficLight(description: light!.description)
    }
}
