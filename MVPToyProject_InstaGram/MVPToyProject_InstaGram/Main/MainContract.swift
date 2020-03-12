
import Foundation


protocol MainViewProtocol{
    
}


protocol MainPresenterProtocol{
    func getFeedData() -> [Feed]
    func getStoryData() -> [Story]
    func addHeartCount(_ index : Int)
}

protocol FeedModelProtocol{
    func getFeedModel() -> [Feed]
}

protocol StoryModelProtocol{
    func getStoryModel() -> [Story]
}
