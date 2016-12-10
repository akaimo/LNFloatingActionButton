//
//  LNFloatingActionButtonEllipseCell.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/12/10.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit

open class LNFloatingActionButtonEllipseCell: LNFloatingActionButtonCell {
    override open var size: CGFloat {
        get { return 0.0 }
        set { print("not used") }
    }
    
    open var ellipseSize: CGSize = CGSize(width: 100, height: 30) {
        didSet {
            self.frame.size = ellipseSize
            resizeSubviews()
        }
    }
    open var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    private let titleLabel = PaddingLabel()
    open var titleMargin: CGFloat = 10.0
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
    open var title: String? = nil {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
//            setTitleLabelPosition()
        }
    }
    
    
    // MARK: - init
    public init(widht: CGFloat, height: CGFloat) {
        super.init()
        self.ellipseSize = CGSize(width: widht, height: height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -
    override open func setup() {
        self.frame.size = ellipseSize
        super.setup()
        self.layer.cornerRadius = cornerRadius
        self.addSubview(titleLabel)
    }
    
    override open func resizeSubviews() {
        // TODO: setup imageView, titleLabel position
    }
}
