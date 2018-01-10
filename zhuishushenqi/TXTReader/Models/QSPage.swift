//
//  QSPage.swift
//  TXTReader
//
//  Created by Nory Cao on 2017/4/14.
//  Copyright © 2017年 masterY. All rights reserved.
//

import UIKit
import ObjectMapper

class Attribute: NSObject,NSCoding {
    var fontSize:Int = 20
    var color:UIColor = UIColor.white
    var lineSpace:Float = 5
    init(fontSize:Int, color:UIColor, lineSpace:Float) {
        self.fontSize = fontSize
        self.color = color
        self.lineSpace = lineSpace
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.fontSize = (aDecoder.decodeInteger(forKey: "fontSize") )
        self.color = aDecoder.decodeObject(forKey: "color") as! UIColor
        self.lineSpace = aDecoder.decodeFloat(forKey: "lineSpace")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.fontSize, forKey: "fontSize")
        aCoder.encode(self.color, forKey: "color")
        aCoder.encode(self.lineSpace, forKey: "lineSpace")
    }
}

class QSPage: NSObject ,NSCoding{
    var content:String? //当前页显示的文字
//    var range:NSRange? //当前页所处范围
    var curPage:Int = 0 //当前页数

    var attribute:Attribute {
        get {
            return Attribute(fontSize: AppStyle.shared.readFontSize, color: UIColor.black, lineSpace: 5)
        }
        set {
            
        }
    }
    var totalPages:Int = 0
    var title:String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.content = aDecoder.decodeObject(forKey: "content") as? String
        self.curPage = aDecoder.decodeInteger(forKey: "curPage")
        self.attribute = aDecoder.decodeObject(forKey: "attribute") as! Attribute
        self.totalPages = aDecoder.decodeInteger(forKey: "totalPages")
        self.title = aDecoder.decodeObject(forKey: "title") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.content, forKey: "content")
        aCoder.encode(self.curPage, forKey: "curPage")
        aCoder.encode(self.attribute, forKey: "attribute")
        aCoder.encode(self.totalPages, forKey: "totalPages")
        aCoder.encode(self.title, forKey: "title")

    }
    
    override init() {
        
    }
    
    required init?(map: Map) {
        
    }

}
