

import UIKit

class CommentViewController : UIViewController, CommentViewProtocol {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedTextLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSubmitButton: UIButton!
    
    var presenter: CommentPresenterProtocol!
    private var commentData: Feed!
    var indexValue: Int!
    
    override func viewDidLoad() {
        presenter = CommentViewPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTableView()
    }
    
    func setUpTableView(){
        commentData = presenter.getFeedData(indexValue)
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.reloadData()
    }
    
    
}

extension CommentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return commentData.comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        cell.commentLabel.text = commentData.comment[indexPath.row].comment
        return cell
    }
    
    
}
