
import UIKit

class FeedCell : UITableViewCell {
    @IBOutlet weak var profileImageView:UIImageView?
    @IBOutlet weak var profileLabel: UILabel?
    @IBOutlet weak var feedImageView: UIImageView?
    @IBOutlet weak var commentButton: UIButton?
    @IBOutlet weak var feedLabel: UILabel?
    @IBOutlet weak var previewCommentTableView: UITableView?
    
    weak var delegate : HeartBtnDelegate?
    
    //피드별 index
    var index: Int!
    var isClicked = false
    
    //댓글 모두보기 버튼 클릭 시 액션
    @IBAction func showMoreComment(_ sender: Any) {
        //버튼 클릭 시 해당피드의 인덱스를 전달하는 Notification 발생
        NotificationCenter.default.post(name: Notification.Name("commentBtnClick"), object: nil, userInfo: ["index":index])
    }
    
    //피드 좋아요 버튼 클릭 시 액션
    @IBAction func giveHeart(_ sender: Any) {
        let heartBtn = sender as! UIButton
        if(!isClicked){
            heartBtn.setImage(UIImage(named: "like"), for: .normal)
            self.delegate?.clickHeartBtn(index, isClicked)
            isClicked = true
        } else {
              heartBtn.setImage(UIImage(named: "heart"), for: .normal)
            self.delegate?.clickHeartBtn(index, isClicked)
            isClicked = false
        }
    }
    
    
}


extension FeedCell{
    func setTableViewDataSourceDelegate(_ dataSourceDelegate: MainViewController, forSection section: Int){
        dataSourceDelegate.sectionValue = section
        previewCommentTableView?.delegate = dataSourceDelegate
        previewCommentTableView?.dataSource = dataSourceDelegate
        previewCommentTableView?.reloadData()
    }
}
