//
//  Observable.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//


/** 
 Простой binding.
 
 Observable - это объект, на который можно подписаться и получать изменения.
 
 Observer - это объект, который передается в замыкании при создании Observable. Нужен для передачи нового значения.
 
 В данной реализации поддерживается только один подписчик.
*/
final class Observable<T> {
    
    typealias Subscriber = (T) -> Void
    
    
    struct Observer {
        let onChange: (T) -> Void
        
        func next(value: T) {
            onChange(value)
        }
    }
    
    
    fileprivate var subscriber: Subscriber?
    
    
    init(handler: (Observer) -> Void) {
        let observer = Observer() { value in
            self.subscriber?(value)
        }
        
        handler(observer)
    }
    
    /**
     Подписывается на изменения значения.
     
     - Parameter onUpdate: Замыкание, которое вызывается после обновления значения
    */
    func subscribe(onUpdate: @escaping Subscriber) {
        subscriber = onUpdate
    }
    
}
