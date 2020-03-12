
import UIKit

class FeedCell : UITableViewCell {
    @IBOutlet weak var profileImageView:UIImageView?
    @IBOutlet weak var profileLabel: UILabel?
    @IBOutlet weak var feedImageView: UIImageView?
    @IBOutlet weak var heartButton: UIButton?
    @IBOutlet weak var commentButton: UIButton?
    @IBOutlet weak var feedLabel: UILabel?
    @IBOutlet weak var previewCommentTableView: UITableView?
    
    //피드 index
    var section: Int = 0
    
    
    //댓글 모두보기 버튼 클릭 시 액션
    @IBAction func showMoreComment(_ sender: Any) {
        //버튼 클릭 시 해당피드의 인덱스를 전달하는 Notification 발생
        NotificationCenter.default.post(name: Notification.Name("commentBtnClick"), object: nil, userInfo: ["index":section])
        
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
