//
//  QSSearchProtocols.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/10.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import UIKit

//MARK: Wireframe -
protocol QSSearchWireframeProtocol: class {
    weak var viewController: UIViewController? { get set }
    func presentDetails(_ novel:Book)
    
    static func createModule() -> UIViewController
}
//MARK: Presenter -
protocol QSSearchPresenterProtocol: class {
    weak var view: QSSearchViewProtocol?{ get set }
    var interactor: QSSearchInteractorProtocol{ get set }
    var router: QSSearchWireframeProtocol{ get set }
    func viewDidLoad()
    func didClickClearBtn()
    func didSelectHotWord(hotword:String)
    func didClickChangeBtn()
    func didSelectResultRow(indexPath:IndexPath)
    func didSelectHistoryRow(indexPath:IndexPath)
}

//MARK: Output -
protocol QSSearchInteractorOutputProtocol: class {
    func fetchHotwordsSuccess(hotwords:[String])
    func fetchHotwordsFailed()
    func searchListFetch(list:[[String]])
    func fetchBooksSuccess(books:[Book],key:String)
    func fetchBooksFailed(key:String)
    func showResult(key:String)
}

//MARK: Interactor -
protocol QSSearchInteractorProtocol: class {
    var output: QSSearchInteractorOutputProtocol! { get set }
    func fetchHotwords()
    func subWords()->[String]
    func fetchSearchList()
    func clearSearchList()
    func updateHistoryList(history:String)
    func fetchBooks(key:String)
}

//MARK: View -
protocol QSSearchViewProtocol: class {
    var presenter: QSSearchPresenterProtocol?  { get set }
    func showNoHotwordsView()
    func showHotwordsData(hotwords:[String])
    func showNoHistoryView()
    func showSearchListData(searchList:[[String]])
    func showBooks(books:[Book],key:String)
}

protocol IndicatableView: class {

}
