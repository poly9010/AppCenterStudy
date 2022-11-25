//
//  custumCell.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/21.
//

import UIKit

class custumCell:UITableViewCell{
    
    var deleteCallBackMethod: (() -> Void)?
    var updateCallBackMethod: (() -> Void)?
    
    var id: String?
    @IBOutlet weak var memoContent: UILabel!

    
    @IBAction func deleteMemo(_ sender: Any) {
        
       deleteCallBackMethod?()
        
    }
    
    func updateCell(memo:MemoInfo){
        id = memo.id
        if (memo.isCompleted == true) {
            memoContent.attributedText = memoContent.text?.strikeThrough()
            memoContent.textColor = .gray

        }
        
        else{
            memoContent.text = memo.content
            memoContent.textColor = .black
  
        }
    
        
    }
    
    
}
