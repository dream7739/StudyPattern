
import Foundation


protocol MainViewProtocol{
    
}


protocol MainPresenterProtocol{
    func getFeedData() -> [Feed]
    func getStoryData() -> [Story]
}

protocol FeedModelProtocol{
    func getFeedModel() -> [Feed]
}

protocol StoryModelProtocol{
    func getStoryModel() -> [Story]
}
