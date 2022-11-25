//
//  codable.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/23.
//

import UIKit

func decoding() {
    
    do {
        let decoder = JSONDecoder()
        if let array = UserDefaults.standard.data(forKey: "memoInfo"){
            let data = try decoder.decode([MemoInfo].self, from: array)
            memoList = data
        }
        
    }catch{
        print(error)
        
    }
    
}

func encoding() {
    let encoder = JSONEncoder()

    /// encoded는 Data형
    if let encoded = try? encoder.encode(memoList) {
        UserDefaults.standard.set(encoded,forKey: "memoInfo")
        print("saving Success")
        print("memo count: ", memoList.count)
    }
    
}
