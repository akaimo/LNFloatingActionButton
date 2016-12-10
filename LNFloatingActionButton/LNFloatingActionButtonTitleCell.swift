//
//  LNFloatingActionButtonTitleCell.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/12/05.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit

open class LNFloatingActionButtonTitleCell: LNFloatingActionButtonCell {
    override weak var actionButton: LNFloatingActionButton? {
        didSet {
            setTitleLabelPosition()
        }
    }
    private let titleLabel = PaddingLabel()
    
    open var titleMargin: CGFloat = 10.0
    override open var size: CGFloat {
        didSet {
            setTitleLabelPosition()
        }
    }
    open var titleLabelSize: CGSize? = nil {
        didSet {
            guard let size = titleLabelSize else { return }
            titleLabel.frame.size = size
            setTitleLabelAlignment()
            titleLabel.baselineAdjustment = .alignCenters
            setTitleLabelPosition()
        }
    }
    open var titleTextAlignment = TitleTextAlignment.right {
        didSet {
            switch titleTextAlignment {
            case .right:
                titleLabel.textAlignment = .right
            case .center:
                titleLabel.textAlignment = .center
            case .left:
                titleLabel.textAlignment = .left
            }
        }
    }
    open var titleColor = UIColor.black {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    open var titleLabelBackgroundColor = UIColor.clear {
        didSet {
            titleLabel.backgroundColor = titleLabelBackgroundColor
        }
    }
    open var title: String? = nil {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
            setTitleLabelPosition()
        }
    }
    
    
    override open func setup() {
        super.setup()
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.masksToBounds = true
        self.addSubview(titleLabel)
    }
    
    private func setTitleLabelPosition() {
        switch actionButton?.titleLabelPosition {
        case .some(let titleLabelPosition):
            switch titleLabelPosition {
            case .left:
                titleLabel.frame.origin.x = -titleLabel.frame.size.width - titleMargin
            case .right:
                titleLabel.frame.origin.x = size + titleMargin
            }
            
        case .none:
            titleLabel.frame.origin.x = -titleLabel.frame.size.width - titleMargin
        }
        titleLabel.frame.origin.y = size/2 - titleLabel.frame.size.height/2
    }
    
    private func setTitleLabelAlignment() {
        switch titleTextAlignment {
        case .right:
            titleLabel.textAlignment = .right
        case .center:
            titleLabel.textAlignment = .center
        case .left:
            titleLabel.textAlignment = .left
        }
    }
}
