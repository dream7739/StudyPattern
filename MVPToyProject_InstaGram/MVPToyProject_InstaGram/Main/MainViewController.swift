

import UIKit


protocol HeartBtnDelegate : NSObjectProtocol {
    func clickHeartBtn(_ index : Int, _ isClicked : Bool)
}

protocol CommentBtnDelegate : NSObjectProtocol {
    func clickCommentBtn(_ index : Int)
}




class MainViewController: UIViewController, MainViewProtocol{
    
    //collectionView와 tableView 선언
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    
    //presenter 선언
    private var presenter : MainPresenterProtocol!
    
    //data 선언
    private var feedData : [Feed] = []
    private var storyData : [Story] = []
    
    var sectionValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //presenter 생성
        presenter = MainPresenter(view: self)
        
        //feedTableView & storyCollectionView 설정
        setUpCollectionView()
        setUpTableView()
        storyCollectionView.reloadData()
        feedTableView.reloadData()
        
        //댓글 모두보기 버튼 클릭 시 notification 수신을 위한 옵저버 설정
        NotificationCenter.default.addObserver(self, selector: #selector(goCommentVC), name: NSNotification.Name("commentBtnClick"), object: nil)
        
    }
    
    
    @objc func goCommentVC(notification : Notification){
        let commentVC = self.storyboard!.instantiateViewController(withIdentifier: "CommentVC") as! CommentViewController
        navigationController?.pushViewController(commentVC, animated: true)
        guard let indexValue = notification.userInfo!["index"] as? Int else { return }
        commentVC.indexValue = indexValue
    }
    
    
    
    //collectionView 설정
    func setUpCollectionView(){
        storyData = self.presenter.getStoryData()
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    
    //tableView 설정
    func setUpTableView(){
        feedData = self.presenter.getFeedData()
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
}




//collectionView delegate & dataSource 설정
extension MainViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = UIScreen.main.bounds.width / 5.9
        let itemHeight = UIScreen.main.bounds.height / 9.96
        let size = CGSize(width: itemWidth, height: itemHeight)
        return size
    }
    
}


extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyData.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        
        let data = storyData[indexPath.row]
        
        cell.profileImageView?.image = UIImage(named: data.profile)
        cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.height)! / 2
        cell.profileImageView?.clipsToBounds = true //지정한 경계선에 이미지를 맞추기
        
        cell.nickNameLabel?.text = data.nickName
        
        return cell
    }
    
}




//tableView delegate & dataSource 설정
extension MainViewController : UITableViewDelegate  {
    
}



extension MainViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(tableView.tag == 100) {
            return feedData[sectionValue].comment.count
        } else {
            return 1
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(tableView.tag == 100){
            return 1
        } else {
            return feedData.count
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView.tag == 100){
            let cell = tableView.dequeueReusableCell(withIdentifier: "insideFeedCell") as! InsideFeedCell
            
            let data = feedData[sectionValue].comment[indexPath.row]
            cell.commentLabel.text = "\(data.commentAutor!)  \(data.comment!)"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedCell
            
            cell.setTableViewDataSourceDelegate(self, forSection: indexPath.section)
            
            let data = feedData[indexPath.section]
            
            cell.profileImageView?.image = UIImage(named: data.profileImage!)
            cell.profileLabel?.text = data.profileName
            cell.feedImageView?.image = UIImage(named: data.feedImage)
            cell.feedLabel?.text = "\(data.profileName!)  " + "\(data.feedText!)"
            cell.index = indexPath.section
            
            cell.heartDelegate = self
            cell.commentDelegate = self
            
            return cell
        }
    }
}

extension MainViewController : HeartBtnDelegate {
    func clickHeartBtn(_ index : Int, _ isClicked : Bool){
        if(!isClicked){
            print("\(index) \(isClicked)")
            presenter.addHeartCount(index)
        }else {
            print("\(index) \(isClicked)")
        }
    }
}

extension MainViewController : CommentBtnDelegate {
    func clickCommentBtn(_ index: Int) {
        let commentVC = self.storyboard!.instantiateViewController(withIdentifier: "CommentVC") as! CommentViewController
        navigationController?.pushViewController(commentVC, animated: true)
        
        commentVC.indexValue = index
    }
    
    
}




