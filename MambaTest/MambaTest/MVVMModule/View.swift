//
//  View.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//

import class UIKit.UILabel
import class UIKit.UITableView
import class UIKit.UITableViewCell
import class UIKit.UIViewController


final class View: UIViewController {

    @IBOutlet fileprivate(set) weak var hintLabel: UILabel!
    @IBOutlet fileprivate(set) weak var tableView: UITableView!
    
    var viewModel: ViewModelInput!
    
    var dataSource = ViewDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDataSource()
        subscribeToViewModelObservables()
    }
    
    
    fileprivate func setupTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    
    fileprivate func setupDataSource() {
        dataSource.didSelectEntity = { [unowned self] entity in
            self.removeEntity(entity)
        }
    }
    
    fileprivate func subscribeToViewModelObservables() {
        viewModel.entitiesObservable.subscribe { [weak self] entities in
            self?.showEntities(entities)
        }
    }
    
    
    @IBAction func addEntity() {
        viewModel.addEntity()
    }
    
    func removeEntity(_ entity: ViewModelEntity) {
        viewModel.removeEntity(by: entity.id)
    }

}

extension View {

    func showEntities(_ entities: [ViewModelEntity]) {
        dataSource.entities = entities
        tableView.reloadData()
        
        hintLabel.isHidden = entities.count > 0
    }

}
