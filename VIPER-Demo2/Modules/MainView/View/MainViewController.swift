//
//  ViewController.swift
//  VIPER-Demo2
//
//  Created by Mahmoud on 10/14/22.
//

import UIKit

protocol MainViewPr {
    //MARK:- Properties
    var presenter: MainPresenterPr? {get set}
    //MARK:- Methods
    
    func userUpdated(users:[MainEntity])
    func userUpdateFailed(error: String)
    
}

class MainViewController: UIViewController, MainViewPr {
    

    //MARK:- Outlets
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    //MARK:- Properties
    var presenter   : MainPresenterPr?
    var usersToView : [MainEntity]?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(myLabel)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myLabel.center = view.center
        tableView.frame = view.bounds
    }

    //MARK:- Methods
    func userUpdated(users: [MainEntity]) {
        // assign it to the array and reload the data in the dispatch queue
        
        DispatchQueue.main.async {
            
            self.usersToView = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func userUpdateFailed(error: String) {
        print("Error has been occured \(error)")
        DispatchQueue.main.async {
            self.myLabel.isHidden = false
            self.myLabel.text = error
            self.tableView.isHidden = true
        }
        
    }
    
    //MARK:- Actions


}

