

import Foundation

struct Story{
    let profile:String
    let nickName:String
}

class StoryModel : StoryModelProtocol {
    var storyArray:[Story] = [Story(profile: "profile", nickName: "pengsu"),Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu"), Story(profile: "profile", nickName: "pengsu")]
    
    func getStoryModel() -> [Story] {
        return storyArray
    }
}
