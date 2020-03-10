

import UIKit

class MainViewController: UIViewController, MainViewProtocol{
    

    //collectionView와 tableView 선언
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    
    //presenter
    private var presenter : MainPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self)
        
        setUpCollectionView()
        setUpTableView()
        storyCollectionView.reloadData()
        feedTableView.reloadData()
    }
    
    
    
    //collectionView 설정
    func setUpCollectionView(){
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = presenter as! UICollectionViewDataSource
    }
    
    //tableView 설정
    func setUpTableView(){
        feedTableView.delegate = self
        feedTableView.dataSource = presenter as! UITableViewDataSource
    }
    
    
    
}


extension MainViewController : UITableViewDelegate {
    
}


extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = UIScreen.main.bounds.width / 5.9
        let itemHeight = UIScreen.main.bounds.height / 9.96
        let size = CGSize(width: itemWidth, height: itemHeight)
        return size
    }
    
}
