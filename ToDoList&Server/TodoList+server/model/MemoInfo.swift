//
//  MemoInfo.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/21.
//

import Foundation


struct MemoInfo: Codable {
    var content: String //내용
    var id:String  //identifier
    var isCompleted: Bool //Todo완료 여부

    init(content: String, isCompleted: Bool) {
        self.content = content
        self.id = UUID().uuidString
        self.isCompleted = isCompleted
    }
}
