//
//  Entity.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//


protocol AnyEntity {
    var id: Int { get }
}


struct Entity: AnyEntity {
    let id: Int
    let title: String
}

struct OtherEntity: AnyEntity {
    let id: Int
    let title: String
    let subtitle: String
}
