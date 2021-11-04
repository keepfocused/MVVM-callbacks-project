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
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func error() {
        updateViewData?(.failure(ViewData.Data(icon: "❌",
        title: "Loading failed",
        description: "Not working",
        numberPhone: nil)))
    }
        
    public func startFetch() {
        updateViewData?(.success(ViewData.Data(icon: "✅",
        title: "Success success",
        description: "Status OK",
        numberPhone: nil)))
    }
}
