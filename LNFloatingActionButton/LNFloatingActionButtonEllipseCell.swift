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
            addTitleLabel()
        }
    }
    
    
    // MARK: - init
    public init(widht: CGFloat, height: CGFloat) {
        super.init()
        self.ellipseSize = CGSize(width: widht, height: height)
        resizeSubviews()
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
        let padding: CGFloat = 10.0
        
        if isVariableSize {
            if image == nil {
                self.frame.size.width = titleLabel.frame.size.width + 2 * padding
                titleLabel.center = self.center
            } else {
                // TODO
            }
        } else {
            if image == nil {
                titleLabel.center = self.center
            } else {
                let imageSize = self.frame.size.height / 2
                imageView.frame = CGRect(x: padding, y: (self.frame.size.height - imageSize) / 2, width: imageSize, height: imageSize)
                // TODO: switch textAlignment
                titleLabel.frame.origin = CGPoint(x: padding + imageSize + 4, y: (self.frame.size.height - titleLabel.frame.size.height) / 2)
            }
        }
    }
}
