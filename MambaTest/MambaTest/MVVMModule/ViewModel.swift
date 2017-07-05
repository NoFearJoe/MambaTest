//
//  ViewModel.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//

import Foundation


protocol ViewModelInput: class {
    var entitiesObservable: Observable<[ViewModelEntity]>! { get }
    
    func addEntity()
    func removeEntity(by id: Int)
}


final class ViewModel<T: AnyEntity> {
    var model: Model<T>!
    var entitiesObservable: Observable<[ViewModelEntity]>!
    
    func setupObservable() {
        entitiesObservable = Observable<[ViewModelEntity]>(handler: { [weak self] observer in
            self?.model.onStorageUpdate = { entities in
                guard let `self` = self else { return }
                
                let viewModelEntities = self.mapEntities(entities)
                observer.next(value: viewModelEntities)
            }
        })
    }
    
}

extension ViewModel: ViewModelInput {

    func addEntity() {
        let randomID = Int(arc4random_uniform(100000))
        
        var randomEntity: T?
        if T.self == Entity.self {
           randomEntity = Entity(id: randomID,
                                 title: "Object ID: \(randomID)") as? T
        } else if T.self == OtherEntity.self {
            randomEntity = OtherEntity(id: randomID,
                                       title: "Object ID: \(randomID)",
                                       subtitle: "subtitle") as? T
        }
        
        if let randomEntity = randomEntity {
            model.perfromUpdate(changes: { storage in
                storage.saveEntity(randomEntity)
            })
        }
    }
    
    func removeEntity(by id: Int) {
        model.perfromUpdate(changes: { storage in
            storage.removeEntity(by: id)
        })
    }

}

extension ViewModel {

    fileprivate func mapEntities(_ entities: [T]) -> [ViewModelEntity] {
        return entities.flatMap { entity in
            if let entity = entity as? Entity {
                return ViewModelEntity(id: entity.id, title: entity.title)
            } else if let otherEntity = entity as? OtherEntity {
                return ViewModelEntity(id: otherEntity.id,
                                       title: otherEntity.title + " " + otherEntity.subtitle)
            }
            return nil
        }
    }

}
