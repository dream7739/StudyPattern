 
 import UIKit
 
 struct Feed{
    var profileImage:String = "profile"
    var profileName: String = "pengsu"
    var feedImage: UIImage!
    var feedText: String?
    var heartCount: Int = 0
    var comment : [Comment] = []
 }
 
 class FeedModel : FeedModelProtocol {
    
    static var feedArray:[Feed] = [Feed(feedImage: UIImage(named: "pengsu"), feedText: "안녕하세요. 펭수입니다.1",heartCount: 0, comment: [Comment(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다1", commentHeart: 0),Comment(commentAutor: "dayeon", comment: "펭수야 너 참 귀엽다1-1", commentHeart: 0)]), Feed(feedImage: UIImage(named: "pengsu"), feedText: "안녕하세요. 펭수입니다.2", heartCount: 0, comment: [Comment(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다2", commentHeart: 0),Comment(commentAutor: "dayeon", comment: "펭수야 너 참 귀엽다2-1", commentHeart: 0)]), Feed(feedImage: UIImage(named: "pengsu"), feedText: "안녕하세요. 펭수입니다.3", heartCount: 0, comment: [Comment(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다3", commentHeart: 0)])]
    
    func getFeedModel() -> [Feed] {
        return FeedModel.feedArray
    }
    
    
 }
