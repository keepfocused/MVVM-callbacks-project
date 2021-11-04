//
//  MainViewModel.swift
//  MVVM project
//
//  Created by Danil  on 04.11.2021.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) ->())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
        
    public func startFetch() {
        // start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: "loading...",
                                               description: "please wait",
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                        title: "Success success",
                                                        description: "Status OK",
                                                        numberPhone: nil)))
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                        title: "Loading failed",
                                                        description: "Not working",
                                                        numberPhone: nil)))
        }
    }
}
