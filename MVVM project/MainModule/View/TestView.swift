//
//  TestView.swift
//  MVVM project
//
//  Created by Danil  on 04.11.2021.
//

import UIKit

class TestView: UIView {
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var iconLabel = makeIconLabel()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            showActivity(show: false, hidden: true)
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            showActivity(show: true, hidden: false)
        case .success(let success):
            update(viewData: success, isHidden: false)
            showActivity(show: false, hidden: true)
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            showActivity(show: false, hidden: true)
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        iconLabel.text = viewData?.icon
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        iconLabel.isHidden = isHidden
    }
    
    func showActivity(show: Bool, hidden: Bool) {
        activityIndicator.isHidden = hidden
        switch show {
        case true:
            activityIndicator.startAnimating()
        case false:
            activityIndicator.stopAnimating()
        }
    }
}
