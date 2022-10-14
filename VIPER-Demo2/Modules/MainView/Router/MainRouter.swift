//
//  MainRouter.swift
//  VIPER-Demo2
//
//  Created by Mahmoud on 10/14/22.
//

import UIKit

typealias EntryPoint = MainViewPr & UIViewController

protocol MainRouterPr {
    //MARK:- Properties
    var entry: EntryPoint? {get}
    
    //MARK:- Methods
    static func start() -> MainRouterPr
    
}

class MainRouter: MainRouterPr{
    
    //MARK:- Properties
    var entry: EntryPoint?

    //MARK:- Methods
    static func start() -> MainRouterPr {
        let router = MainRouter()

        // VIP
        var view        : MainViewPr            = MainViewController()
        var interactor  : MainInteractorPr      = MainInteractor()
        var presenter   : MainPresenterPr       = MainPresenter()
        
        view.presenter          = presenter
        interactor.presenter    = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.entry = view as? EntryPoint
        return router
    }
    


}
