//
//  BokShelfInfo.swift
//  zhuishushenqi
//
//  Created by Nory Chao on 2017/3/6.
//  Copyright © 2017年 QS. All rights reserved.
//

import UIKit


class BookShelfInfo: NSObject {
    
    static let books = BookShelfInfo()
    private override init() {
        
    }
    
    let bookShelfInfo = "bookShelfInfo"
    //Local store BookDetail models array when you add persue update
    var bookShelf:[BookDetail] {
        get{
            var data:[BookDetail]? = []
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last?.appending("/\(bookShelfInfo.md5())")
            if let filePath = path {
                let file:NSDictionary? = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? NSDictionary
                data = file?[bookShelfInfo] as? [BookDetail]
            }
            return data ?? []
        }
        set{
            let dict = [bookShelfInfo:newValue]
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last?.appending("/\(bookShelfInfo.md5())")
            
            if let filePath = path {
                do {
                    let url = URL(string: filePath)
                    try  FileManager.default.removeItem(at: url!)
                } catch  {
                    
                }
                NSKeyedArchiver.archiveRootObject(dict, toFile: filePath)
            }
        }
    }
    
}
