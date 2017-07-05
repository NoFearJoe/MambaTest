//
//  Model.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//


final class Model<T: AnyEntity> {

    let storage = Storage<T>()
    
    var onStorageUpdate: (([T]) -> Void)?
    
    
    func perfromUpdate(changes: (Storage<T>) -> Void) {
        changes(storage)
        onStorageUpdate?(storage.obtainEntities())
    }

}
