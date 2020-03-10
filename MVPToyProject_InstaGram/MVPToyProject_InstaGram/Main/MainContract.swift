
import Foundation


protocol MainViewProtocol{
    
}


protocol MainPresenterProtocol{
    
}

protocol FeedModelProtocol{
    func getFeedModel() -> [Feed]
}

protocol StoryModelProtocol{
    func getStoryModel() -> [Story]
}
