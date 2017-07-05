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

}

// MARK: - UI setup

extension View {

    fileprivate func setupTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    
    fileprivate func setupDataSource() {
        dataSource.didSelectEntity = removeEntity        
    }
    
    fileprivate func subscribeToViewModelObservables() {
        viewModel.entities ~> showEntities
    }

}

// MARK: - Actions

extension View {

    @IBAction func addEntity() {
        viewModel.addEntity()
    }
    
    func removeEntity(_ entity: ViewModelEntity) {
        viewModel.removeEntity(by: entity.id)
    }

}

// MARK: - UI update methods

extension View {

    func showEntities(_ entities: [ViewModelEntity]) {
        dataSource.entities = entities
        tableView.reloadData()
        
        setHintHidden(entities.count > 0)
    }
    
    func setHintHidden(_ hidden: Bool) {
        hintLabel.isHidden = hidden
    }

}
