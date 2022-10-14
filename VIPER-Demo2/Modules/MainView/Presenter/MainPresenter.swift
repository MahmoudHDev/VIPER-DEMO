//
//  MainPresenter.swift
//  VIPER-Demo2
//
//  Created by Mahmoud on 10/14/22.
//

import Foundation
enum FetchError:Error {
    case failed
}


// Ref to the IRV; Interactor, Router and View.

protocol MainPresenterPr {
    //MARK:- Properties
    var interactor  : MainInteractorPr? {get set}
    var view        : MainViewPr? {get set}
    var router      : MainRouterPr? {get set}

    //MARK:- Methods
    func interactorDidFetchUser(with result: Result<[MainEntity], Error>)
    
}

class MainPresenter: MainPresenterPr {
    //MARK:- Properties

    var view: MainViewPr?
    
    var router: MainRouterPr?
    
    var interactor: MainInteractorPr? {
        // when the presenter starts, this property will awake.
        didSet {
            interactor?.getData()
        }
    }
    
    //MARK:- Methods
    func interactorDidFetchUser(with result: Result<[MainEntity], Error>) {
        // Do Something with Result
        switch result {
        case .success(let newUsers):
            view?.userUpdated(users: newUsers)
        default:
            view?.userUpdateFailed(error: "Error")
        }
    }
}
