//
//  ModelAssembly.swift
//  MambaTest
//
//  Created by Ilya Kharabet on 05.07.17.
//  Copyright © 2017 IK. All rights reserved.
//



final class ModuleAssembly<T: AnyEntity> {

    class func assembly(with view: View) {
        let model = Model<T>()
        let viewModel = ViewModel<T>()
        
        viewModel.model = model
        
        view.viewModel = viewModel
    }

}
