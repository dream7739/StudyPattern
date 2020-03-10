

import UIKit

class FeedCommentPresenter : NSObject {
    var section = 0
    private var feedModel =  FeedModel()
}

//댓글 tableView에 들어갈 데이터 세팅
extension FeedCommentPresenter : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedModel.getFeedModel()[self.section].comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tag에 따라 다른 셀을 리턴
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsideFeedCell") as! InsideFeedCell
        let commentData = feedModel.getFeedModel()[self.section].comment[indexPath.row]

        
        let commentAuthor = "\(commentData.commentAutor!)" + "  "
        let comment = "\(commentData.comment!)"
        cell.commentLabel.text = commentAuthor + comment
        
        return cell
        
    }
    
    
}

