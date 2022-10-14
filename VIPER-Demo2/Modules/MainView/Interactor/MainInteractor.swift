//
//  MainInteractor.swift
//  VIPER-Demo2
//
//  Created by Mahmoud on 10/14/22.
//

import Foundation

protocol MainInteractorPr{
    // Ref with the presenter
    //MARK:- Properties
    var presenter: MainPresenterPr? {get set}
    
    //MARK:- Methods
    func getData()
}

class MainInteractor: MainInteractorPr {
    //MARK:- Properties
    
    var presenter: MainPresenterPr?

    //MARK:- Methods
    func getData() {
        // Logic will be here
        print("Data is fetching")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonDecoder = try JSONDecoder().decode([MainEntity].self, from: data)
                self.presenter?.interactorDidFetchUser(with: .success(jsonDecoder))
            }catch {
                print("error Has \(error.localizedDescription)")
                self.presenter?.interactorDidFetchUser(with: .failure(FetchError.failed))
            }
        }
        task.resume()
    }
}
