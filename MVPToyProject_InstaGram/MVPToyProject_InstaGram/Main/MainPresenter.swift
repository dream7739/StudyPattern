
import UIKit


class MainPresenter : NSObject, MainPresenterProtocol {
    private var view : MainViewProtocol!
    private var feedModel = FeedModel()
    private var storyModel = StoryModel()
    
    private let cellIdentifier = "storyCell"
    private let presenter = FeedCommentPresenter()
    
    
    init(view: MainViewProtocol){
        self.view = view
    }
}



//collectionView에 들어갈 데이터 세팅
extension MainPresenter : UICollectionViewDataSource {
    
    
    //story collectionView에 들어갈 아이템의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyModel.getStoryModel().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! StoryCell
        
        let storyData = storyModel.getStoryModel()
        
        cell.profileImageView?.image = UIImage(named: storyData[indexPath.row].profile)
        cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.height)! / 2
        cell.profileImageView?.clipsToBounds = true //지정한 경계선에 이미지를 맞추기
        
        cell.nickNameLabel?.text = storyData[indexPath.row].nickName
        
        return cell
    }
    
    
}



//feed tableView에 들어갈 데이터 세팅
extension MainPresenter : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedModel.getFeedModel().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        
        cell.setTableViewDataSourceDelegate(presenter, forSection: indexPath.section)
        
        let feedData = feedModel.getFeedModel()[indexPath.section]
        cell.profileImageView?.image = UIImage(named: feedData.profileImage!)
        cell.profileLabel?.text = feedData.profileName
        cell.feedImageView?.image = UIImage(named: feedData.feedImage)
        cell.feedLabel?.text = "\(feedData.profileName!)  " + "\(feedData.feedText!)"
        
        
        return cell
    }
    
    
    
}
