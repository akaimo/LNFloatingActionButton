//
//  LNFloatingActionButtonCell.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/11/26.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit

open class LNFloatingActionButtonCell: UIView {
    weak var actionButton: LNFloatingActionButton?
    private let imageView = UIImageView()
    private let titleLabel = PaddingLabel()
    
    open var internalRatio: CGFloat = 0.75
    open var titleMargin: CGFloat = 10.0
    open var responsible = true
    
    open var size: CGFloat = 42 {
        didSet {
            self.center = CGPoint(x: size/2, y: size/2)
            setTitleLabelPosition()
            resizeSubviews()
        }
    }
    open var titleLabelSize: CGSize? = nil {
        didSet {
            guard let size = titleLabelSize else { return }
            titleLabel.frame.size = size
            titleLabel.textAlignment = .right  // TODO: left, center
            titleLabel.baselineAdjustment = .alignCenters
            setTitleLabelPosition()
        }
    }
    open var color = UIColor(red: 0/255.0, green: 157/255.0, blue: 238/255.0, alpha: 1.0) {
        didSet {
            self.backgroundColor = color
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
    
    
    // MARK: - init
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    

    // MARK: - Private
    private func setup() {
        self.backgroundColor = color
        self.clipsToBounds = false
        self.layer.cornerRadius = frame.width / 2
        imageView.clipsToBounds = false
        self.addSubview(imageView)
        resizeSubviews()
        self.addSubview(titleLabel)
    }
    
    private func resizeSubviews() {
        let size = CGSize(width: frame.width * 0.5, height: frame.height * 0.5)
        imageView.frame = CGRect(x: frame.width - frame.width * internalRatio, y: frame.height - frame.height * internalRatio,
                                 width: size.width, height: size.height)
    }
    
    private func setTitleLabelPosition() {
        titleLabel.frame.origin.x = -titleLabel.frame.size.width - titleMargin
        titleLabel.frame.origin.y = self.frame.height/2 - titleLabel.frame.size.height/2
    }
    
    
    // MARK: - Event
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if responsible {
            // TODO: Customize
            backgroundColor = color.withAlphaComponent(0.5)
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if responsible {
            backgroundColor = color
        }
        actionButton?.didTap(cell: self)
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        if responsible {
            backgroundColor = color
        }
    }
    
}




class PaddingLabel: UILabel {
    // TODO: customize
    var padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    
    override func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawText(in: newRect)
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicContentSize = super.intrinsicContentSize
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        frame = CGRect(x: frame.origin.x + (padding.left + padding.right)/2,
                       y: frame.origin.y + (padding.top + padding.bottom)/2,
                       width: frame.size.width + padding.left + padding.right,
                       height: frame.size.height + padding.top + padding.bottom)
    }
}
