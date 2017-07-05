//
//  Storage.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//


// Имитирует хранилище для каких-то сущностей типа EntityProtocol
final class Storage<T: AnyEntity> {

    fileprivate lazy var objects: [T] = []
    
    
    func saveEntity(_ entity: T) {
        objects.append(entity)
    }
    
    func removeEntity(by id: Int) {
        if let index = objects.index(where: { $0.id == id }) {
            objects.remove(at: index)
        }
    }
    
    func obtainEntities() -> [T] {
        return objects
    }

}
