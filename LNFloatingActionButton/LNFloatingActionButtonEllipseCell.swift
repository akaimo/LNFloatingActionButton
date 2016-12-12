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
        get { return ellipseSize.height }
        set { print("'size' should not be used") }
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
    
    open var isVariableSize = false {
        didSet {
            resizeSubviews()
        }
    }
    
    private let imageView = UIImageView()
    override open var image: UIImage? {
        didSet {
            imageView.image = image
            addImageView()
        }
    }
    
    private let titleLabel = PaddingLabel()
    open var titleMargin: CGFloat = 4.0
    open var cellPadding: CGFloat = 10.0
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
            resizeSubviews()
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
            addTitleLabel()
        }
    }
    
    
    // MARK: - init
    override public init() {
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -
    override open func setup() {
        super.setup()
        self.frame.size = ellipseSize
        self.layer.cornerRadius = cornerRadius
    }
    
    override open func addImageView() {
        imageView.clipsToBounds = false
        self.addSubview(imageView)
        resizeSubviews()
    }
    
    open func addTitleLabel() {
        self.addSubview(titleLabel)
        resizeSubviews()
    }
    
    override open func resizeSubviews() {
        titleLabel.sizeToFit()
        
        if isVariableSize {
            if image == nil {
                self.frame.size.width = titleLabel.frame.size.width + 2*cellPadding
                titleLabel.center = self.center
            } else {
                let imageSize = self.frame.size.height / 2
                imageView.frame = CGRect(x: cellPadding, y: (self.frame.size.height - imageSize) / 2, width: imageSize, height: imageSize)
                titleLabel.frame.origin = CGPoint(x: cellPadding + imageSize + titleMargin,
                                                  y: (self.frame.size.height - titleLabel.frame.size.height) / 2)
                self.frame.size.width = cellPadding + imageSize + titleMargin + titleLabel.frame.size.width + cellPadding
            }
        } else {
            if image == nil {
                titleLabel.center = self.center
            } else {
                let imageSize = self.frame.size.height / 2
                imageView.frame = CGRect(x: cellPadding, y: (self.frame.size.height - imageSize) / 2, width: imageSize, height: imageSize)
                switch titleTextAlignment {
                case .left:
                    titleLabel.frame.origin = CGPoint(x: cellPadding + imageSize + 4,
                                                      y: (self.frame.size.height - titleLabel.frame.size.height) / 2)
                    
                case .center:
                    titleLabel.frame.origin = CGPoint(x: 0,
                                                      y: (self.frame.size.height - titleLabel.frame.size.height) / 2)
                    titleLabel.center.x = self.center.x + imageSize/2
                    
                case .right:
                    titleLabel.frame.origin = CGPoint(x: self.frame.size.width - (titleLabel.frame.size.width + cellPadding),
                                                      y: (self.frame.size.height - titleLabel.frame.size.height) / 2)
                }
            }
        }
    }
}
