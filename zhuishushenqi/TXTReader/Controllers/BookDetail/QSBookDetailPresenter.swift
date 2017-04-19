//
//  QSBookDetailPresenter.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/13.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSBookDetailPresenter: QSBookDetailPresenterProtocol {

    weak var view: QSBookDetailViewProtocol?
    private let interactor: QSBookDetailInteractorProtocol
    let router: QSBookDetailWireframeProtocol

    var ranks:[QSHotComment] = []
    var show:Bool = false
    
    init(interface: QSBookDetailViewProtocol, interactor: QSBookDetailInteractorProtocol, router: QSBookDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(id: String) {
        interactor.requestData(id: id)
        view?.showActivityView()
    }
    
    func didClickReadingBtn(model:BookDetail,select:Bool){
        let allChapterUrl = "\(BASEURL)/toc"
        interactor.requestAllChapters(withUrl: allChapterUrl,param:["view":"summary","book":model._id ])
        view?.showActivityView()
    }
    
    func didClickPersueBtn(model:BookDetail,select:Bool){
        //需要遍历删除
        if select == true {
            updateBookShelf(bookDetail: model, type: .add)
        }else{
            updateBookShelf(bookDetail: model, type: .delete)
        }
        QSLog(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
    }
    
    func didClickCacheAll(){
        
    }
    
    func didSelectRow(indexPath:IndexPath){
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                self.show = !self.show
                fetchContent(show: self.show)
            }
        }
        if indexPath.section == 1 {
            router.presentComment(id: ranks[indexPath.row]._id)
        }
    }
}

extension QSBookDetailPresenter:QSBookDetailInteractorOutputProtocol{
    func fetchBookSuccess(bookDetail:BookDetail,ranks:[QSHotComment]){
        self.ranks = ranks
        view?.showResult(bookDetail: bookDetail, comment: ranks)
        view?.hideActivityView()
    }
    
    func fetchRankFailed() {
        view?.hideActivityView()
    }
    
    func fetchContent(show: Bool) {
        view?.showContent(show: show)
    }
    
    func fetchAllChapterSuccess(bookDetail:BookDetail,res:[ResourceModel]){
        router.presentReading(model: res, booDetail: bookDetail)
        view?.hideActivityView()
    }
    
    func fetchAllChapterFailed(){
        view?.hideActivityView()
    }
}
