//
//  ViewDataSource.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//

import class Foundation.NSObject
import struct Foundation.IndexPath
import class UIKit.UITableView
import class UIKit.UITableViewCell
import protocol UIKit.UITableViewDelegate
import protocol UIKit.UITableViewDataSource


final class ViewDataSource: NSObject {

    lazy var entities: [ViewModelEntity] = []
    
    var didSelectEntity: ((ViewModelEntity) -> Void)?
    
}

extension ViewDataSource: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntityCell", for: indexPath)
        
        let entity = entities[indexPath.row]
        cell.textLabel?.text = entity.title
        
        return cell
    }

}

extension ViewDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity = entities[indexPath.row]
        didSelectEntity?(entity)
    }

}
