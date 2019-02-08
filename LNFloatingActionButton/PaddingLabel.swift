//
//  PaddingLabel.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/12/05.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    // TODO: customize
    var padding = UIEdgeInsets(top: 4, left: 6, bottom: 4, right: 6)
    
    override func drawText(in rect: CGRect) {
        let newRect = rect.inset(by: padding)
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
