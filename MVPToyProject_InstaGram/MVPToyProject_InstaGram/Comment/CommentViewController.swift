

import UIKit

class CommentViewController : UIViewController, CommentViewProtocol {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedTextLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSubmitButton: UIButton!
    
    private var presenter: CommentPresenterProtocol!
    private var feedData: Feed!
    var indexValue: Int!
    
    override func viewDidLoad() {
        presenter = CommentViewPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        feedData = presenter.getFeedData(indexValue)
        setUpTableView()
        
        profileImageView.image = UIImage(named: feedData.profileImage!)
        nickNameLabel.text = feedData.profileName
        feedTextLabel.text = feedData.feedText ?? " "
        
        
    }
    
    func setUpTableView(){
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.reloadData()
    }
    
    
}

extension CommentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return feedData.comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        let data = feedData.comment[indexPath.row]
        cell.commentLabel.text = "\(data.commentAutor!)  " + "\(data.comment!)"
        return cell
    }
    
    
}
