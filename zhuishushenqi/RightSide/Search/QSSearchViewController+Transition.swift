//
//  QSSearchViewController+Transition.swift
//  zhuishushenqi
//
//  Created by caonongyun on 2017/4/12.
//  Copyright © 2017年 QS. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UI
extension QSSearchViewController{
    enum SearchShowType {
        case history
        case searching
        case associate
    }
    
    func showHistory(){
        UIView.animate(withDuration: 0.35) {
            self.tableView.frame = self.getFrame(type: .history)
        }
        self.tableView.removeFromSuperview()
        self.view.addSubview(self.tableView)
    }
    
    func showSearching(){
        UIView.animate(withDuration: 0.35) {
            self.tableView.frame = self.getFrame(type: .searching)
        }
        self.tableView.removeFromSuperview()
        self.searchController.view.addSubview(self.tableView)
    }
    
    func showAssociate(){
        self.tableView.removeFromSuperview()
        self.tableView.frame = self.getFrame(type: .associate)
        self.searchController.view.addSubview(self.tableView)
    }
    
    func showResultTable(key:String){
        self.searchController.dismiss(animated: true, completion: nil)
        self.searchController.searchBar.text = key
        self.tableView.removeFromSuperview()
        self.view.addSubview(self.resultTableView)
    }
    
    func getFrame( type:SearchShowType)->CGRect{
        var searchFrame = CGRect.zero
        switch type {
        case .history:
            searchFrame = CGRect(x: 0, y: 114, width: ScreenWidth, height: ScreenHeight - 114)
            break
        case .searching:
            searchFrame = CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64)
            break
        case .associate:
            searchFrame = CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64)
            break
        }
        return searchFrame
    }
}
