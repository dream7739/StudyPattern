
import Foundation

protocol CommentViewProtocol {
    
    
}

protocol CommentPresenterProtocol {
    //해당 피드의 정보를 가져오기 위한 함수
    func getFeedData(_ at: Int) -> Feed
    
    //댓글 추가를 위한 함수
    func addComment(_ at: Int, _ comment: String)}



protocol CommentModelProtocol {
    
}
