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
    
    open var internalRatio: CGFloat = 0.75
    open var responsible = true
    
    open var size: CGFloat = 42 {
        didSet {
            self.center = CGPoint(x: size/2, y: size/2)
            resizeSubviews()
        }
    }
    
    open var color = UIColor(red: 0/255.0, green: 157/255.0, blue: 238/255.0, alpha: 1.0) {
        didSet {
            self.backgroundColor = color
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
    

    // MARK: -
    func setup() {
        self.backgroundColor = color
        self.clipsToBounds = false
        self.layer.cornerRadius = frame.width / 2
        imageView.clipsToBounds = false
        self.addSubview(imageView)
        resizeSubviews()
        
    }
    
    func resizeSubviews() {
        let size = CGSize(width: frame.width * 0.5, height: frame.height * 0.5)
        imageView.frame = CGRect(x: frame.width - frame.width * internalRatio, y: frame.height - frame.height * internalRatio,
                                 width: size.width, height: size.height)
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
