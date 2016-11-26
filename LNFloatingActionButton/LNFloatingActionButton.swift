//
//  LNFloatingActionButton.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/11/26.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import QuartzCore

open class LNFloatingActionButton: UIView {
    open let imageView = UIImageView()
    open var internalRatio: CGFloat = 0.75
    
    open override var frame: CGRect {
        didSet {
            resizeSubviews()
        }
    }
    open var color = UIColor(red: 0/255.0, green: 157/255.0, blue: 238/255.0, alpha: 1.0) {
        didSet {
            backgroundColor = color
        }
    }
    
    
    // MARK: - init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Open
    open func open() {}
    open func close() {}
    
    
    // MARK: - Private
    private func setup() {
        backgroundColor = color
        clipsToBounds = false
        layer.cornerRadius = frame.width / 2
        imageView.clipsToBounds = false
        addSubview(imageView)
        resizeSubviews()
    }
    
    private func resizeSubviews() {
        let size = CGSize(width: frame.width * 0.5, height: frame.height * 0.5)
        imageView.frame = CGRect(x: frame.width - frame.width * internalRatio, y: frame.height - frame.height * internalRatio,
                                 width: size.width, height: size.height)
    }
    
    
    // MARK: - Action
    private func didTap() {}
    
    
    // MARK: - Event
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    open override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {}
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
}
