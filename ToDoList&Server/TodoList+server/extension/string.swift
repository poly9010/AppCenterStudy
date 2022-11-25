//
//  string.swift
//  TodoList+server
//
//  Created by 김민정 on 2022/11/25.
//

import Foundation
import UIKit

extension String {
    // 취소선 긋기
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
