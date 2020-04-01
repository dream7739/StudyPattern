//
//  UpLoadPresenter.swift
//  MVPToyProject_InstaGram
//
//  Created by 홍정민 on 2020/04/01.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import UIKit

class UpLoadPresenter : UpLoadPresenterProtocol {
    private var view: UpLoadViewProtocol!
    
    init(view : UpLoadViewProtocol){
        self.view = view
    }
    
    func addFeedModel(_ feed: Feed) {
        FeedModel.feedArray.append(feed)
    }
    
    
}
