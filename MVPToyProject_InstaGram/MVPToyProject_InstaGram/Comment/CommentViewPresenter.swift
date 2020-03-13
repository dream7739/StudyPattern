

import UIKit


class CommentViewPresenter : CommentPresenterProtocol {
    
    private let view : CommentViewProtocol!
    private let model = FeedModel()
    
    init(view : CommentViewProtocol) {
        self.view = view
    }
    
    
    func getFeedData(_ at : Int) -> Feed {
        return model.getFeedModel()[at]
    }
    
    
    func addComment(_ at: Int, _ comment: String) {
        var commentModel = Comment()
        commentModel.comment = comment
        commentModel.commentAutor = "jmzzang"
        commentModel.commentHeart = 0

        model.feedArray[at].comment += [commentModel]
        
    }
    
    
}

