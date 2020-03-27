
import UIKit


class MainPresenter : NSObject, MainPresenterProtocol {
    
    
    private var view : MainViewProtocol!
    private var feedModel = FeedModel()
    private var storyModel = StoryModel()
        
    
    init(view: MainViewProtocol){
        self.view = view
    }
    
    
    func getFeedData() -> [Feed] {
        return FeedModel.feedArray
    }
    
    func getStoryData() -> [Story] {
        return StoryModel.storyArray
    }
    
    func addHeartCount(_ index : Int){
        FeedModel.feedArray[index].heartCount += 1
    }
    
  
    
}

