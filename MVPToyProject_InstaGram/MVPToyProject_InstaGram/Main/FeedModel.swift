 
 import Foundation
 
 struct Feed{
    var profileImage:String?
    var profileName: String!
    var feedImage: String!
    var feedText: String?
    var comment : [CommentModel]
    
 }
 
 class FeedModel : FeedModelProtocol {
    
    var feedArray:[Feed] = [Feed(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.1", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다1", commentHeart: 0),CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다1-1", commentHeart: 0)]), Feed(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.2", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다2", commentHeart: 0),CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다2-1", commentHeart: 0)]), Feed(profileImage: "profile", profileName: "pengsu", feedImage: "pengsu", feedText: "안녕하세요. 펭수입니다.3", comment: [CommentModel(commentAutor: "jmzzang", comment: "펭수야 너 참 귀엽다3", commentHeart: 0)])]
    
    func getFeedModel() -> [Feed] {
        return feedArray
    }
    
    
 }