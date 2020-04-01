//
//  UpLoadViewController.swift
//  MVPToyProject_InstaGram
//
//  Created by 홍정민 on 2020/04/01.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import UIKit

class UpLoadViewController : UIViewController,UpLoadViewProtocol, UITextFieldDelegate {
    private var upLoadImage :UIImage?
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var noImageLabel: UILabel!
    @IBOutlet weak var TFfeedText: UITextField!
    private let picker = UIImagePickerController()
    private var upLoadPresenter: UpLoadPresenterProtocol!
    
    //사진을 추가하는 액션
    @IBAction func addPhotoAction(_ sender: Any) {
        self.openLibrary()
    }
    
    //피드를 저장하는 액션
    @IBAction func feedSaveAction(_ sender: Any) {
        
        if let feedImage = upLoadImage {
            var upLoadFeed = Feed()
            upLoadFeed.feedImage = feedImage
            
            if let feedText = TFfeedText.text {
                upLoadFeed.feedText = feedText
            }
            
            upLoadPresenter.addFeedModel(upLoadFeed)
            self.tabBarController?.selectedIndex = 0
        }else {
            let alert = UIAlertController(title: "업로드 불가", message: "사진을 첨부해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
    
    
    override func viewDidLoad() {
        upLoadPresenter = UpLoadPresenter(view: self)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        TFfeedText.delegate = self
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        TFfeedText.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //텍스트필드의 현재 상태를 포기했다는 요청을 리시버에 알려주며 자동으로 키보드가 내려가게 됨
        TFfeedText.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification : Notification){
        if let keyboardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keybaordRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keybaordRectangle.height
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification : Notification){
        if let keyboardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
          let keybaordRectangle = keyboardFrame.cgRectValue
          let keyboardHeight = keybaordRectangle.height
              self.view.frame.origin.y += keyboardHeight
          }
    }
    
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
}

extension UpLoadViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            upLoadImage = image
        }
        dismiss(animated: true){
            self.noImageLabel.isHidden = true
            self.photoImageView.image = self.upLoadImage!
        }
    }
}

