

import UIKit


class CommentViewPresenter : CommentPresenterProtocol {
 
    private let cellIdentifier = "CommentCell"
    private let view : CommentViewProtocol!
    private let model = FeedModel()
    
    init(view : CommentViewProtocol) {
        self.view = view
    }

    

    
    func getFeedData(_ at : Int) -> Feed {
        return model.getFeedModel()[at]
     }
    
}

