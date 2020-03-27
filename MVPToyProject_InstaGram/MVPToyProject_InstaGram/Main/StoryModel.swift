

import Foundation

struct Story{
    let profile:String
    let nickName:String
}

class StoryModel : StoryModelProtocol {
    static var storyArray:[Story] = [Story(profile: "profile", nickName: "pengsu"),Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu")]
    
    func getStoryModel() -> [Story] {
        return StoryModel.storyArray
    }
}
