
import UIKit


class MainPresenter : NSObject, MainPresenterProtocol {
    
    
    private var view : MainViewProtocol!
    private var feedModel = FeedModel()
    private var storyModel = StoryModel()
    
    private let presenter = FeedCommentPresenter()
    
    
    init(view: MainViewProtocol){
        self.view = view
    }
    
    
    func getFeedData() -> [Feed] {
        return self.feedModel.getFeedModel()
    }
    
    func getStoryData() -> [Story] {
        return self.storyModel.getStoryModel()
    }
    
  
    
}

