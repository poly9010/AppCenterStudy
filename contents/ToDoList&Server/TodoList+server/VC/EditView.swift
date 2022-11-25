//
//  EditView.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/22.
//

import Foundation
import UIKit


class EditView:UIViewController {

    
    var data: MemoInfo?
    var delegate: sendUpdateDelegate?
    
    var completed: Bool = false
    

    @IBOutlet weak var memoContent: UITextField!
    @IBOutlet weak var ingBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    
    @IBAction func deletePopupBtn(_ sender: Any){

        self.dismiss(animated: true)
    }
    
    @IBAction func isNotCompleted(_ sender: Any){
        ingBtn.backgroundColor = .lightGray
        completeBtn.backgroundColor = .white
        completed = false
    }
    
    @IBAction func isCompleted(_ sender: Any){
        completed = true
        completeBtn.backgroundColor = .lightGray 
        ingBtn.backgroundColor = .white
    }
    
    @IBAction func isSaving(_ sender: Any){
        
        var updatedMemo = MemoInfo(content: memoContent.text ?? "", isCompleted: completed)
        updatedMemo.id = data?.id ?? ""
        
        print("saving...")
        delegate?.sendData(data: updatedMemo)
        self.dismiss(animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMemo()
    }
    
    func updateMemo(){
        memoContent.text = data?.content
    }
}

protocol sendUpdateDelegate{
    func sendData(data:MemoInfo)
}

