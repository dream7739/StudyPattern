

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
    private var feedData: Feed!
    var indexValue: Int!
    
    override func viewDidLoad() {
        presenter = CommentViewPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        feedData = presenter.getFeedData(indexValue)
        
        self.commentTextField.delegate = self
        
        setUpTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textfieldConstraint.constant += keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textfieldConstraint.constant -= keyboardHeight
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
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
