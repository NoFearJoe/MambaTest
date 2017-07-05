//
//  Observable.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//


// MARK: - Простой биндинг начинается здесь


final class Observable<T> {

    typealias Subscriber = (T) -> Void
    
    fileprivate lazy var subscribers = [Subscriber]()
    
    var value: T {
        didSet {
            subscribers.forEach { $0(value) }
        }
    }
    
    /**
     Создает новый Observable с каким-то значением
 
     - Parameter value: Значение переменной, на изменение которой будут подписываться другие классы
    */
    init(value: T) {
        self.value = value
    }
    
    /**
     Добавляет подписчика и передает ему текущее значение
     
     - Parameter subscriber: Подписчик
    */
    func bind(subscriber: @escaping Subscriber) {
        subscribers.append(subscriber)
        subscriber(value)
    }
    
}


infix operator ~>

/// Просто сахар
func ~> <T>(observable: Observable<T>, subscriber: @escaping (T) -> Void) {
    observable.bind(subscriber: subscriber)
}


