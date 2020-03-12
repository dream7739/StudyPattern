
import UIKit


class MainPresenter : NSObject, MainPresenterProtocol {
    
    
    private var view : MainViewProtocol!
    private var feedModel = FeedModel()
    private var storyModel = StoryModel()
        
    
    init(view: MainViewProtocol){
        self.view = view
    }
    
    
    func getFeedData() -> [Feed] {
        return self.feedModel.getFeedModel()
    }
    
    func getStoryData() -> [Story] {
        return self.storyModel.getStoryModel()
    }
    
    func addHeartCount(_ index : Int){
        self.feedModel.feedArray[index].heartCount += 1
    }
    
  
    
}

