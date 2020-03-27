

import UIKit

class CommentViewController : UIViewController, UITextFieldDelegate, CommentViewProtocol {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedTextLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSubmitButton: UIButton!
    @IBOutlet weak var textfieldConstraint: NSLayoutConstraint!
    
    private var presenter: CommentPresenterProtocol!
    var indexValue: Int!
    
    override func viewDidLoad() {
        presenter = CommentViewPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        let data = presenter.getFeedData(indexValue)
        profileImageView.image = UIImage(named: data.profileImage!)
        nickNameLabel.text = data.profileName!
        feedTextLabel.text = data.feedText!
        self.commentTextField.delegate = self

        setUpTableView()

        commentSubmitButton.addTarget(self, action: #selector(submitComment), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
    //키보드 리턴 버튼 클릭 시 키보드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

    
    //키보드 나타날 때 텍스트 필드 constraint 증가
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textfieldConstraint.constant += keyboardHeight
        }
    }
    
    
    //키보드 들어갈 때 텍스트 필드 constraint 감소
    @objc func keyboardWillHide(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textfieldConstraint.constant -= keyboardHeight
        }
        
    }
    
    
    //화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    //테이블뷰 설정
    func setUpTableView(){
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.reloadData()
    }
    
    
    @objc func submitComment(){
        guard let comment = commentTextField.text else { return }
        self.presenter.addComment(indexValue, comment)
        self.commentTableView.reloadData()
    }
    
    
}



extension CommentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return presenter.getFeedData(indexValue).comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        let data = presenter.getFeedData(indexValue).comment[indexPath.row]
        cell.commentLabel.text = "\(data.commentAutor!)  " + "\(data.comment!)"
        return cell
    }
    
    
}
