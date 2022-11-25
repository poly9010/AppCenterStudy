//
//  plusView.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/23.
//

import Foundation
import UIKit

class PlusView: UIViewController{
    
    @IBOutlet weak var popupView: UIView! //새 todo를 작성하는 창
    
    @IBOutlet weak var memoContent: UITextField!

    @IBAction func deletePopupBtn(_ sender: Any){

        self.dismiss(animated: true)
    }
    
    @IBAction func isSaving(_ sender: Any){
        
        let newMemo = MemoInfo(content: memoContent.text ?? "", isCompleted: false)
        memoList.append(newMemo)
        encoding()
        print("Saving Success")
        self.dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        overlay!.backgroundColor = UIColor.black
//        overlay!.alpha = 0.8
//        view.addSubview(overlay!)

    }

}


