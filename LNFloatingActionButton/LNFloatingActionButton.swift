//
//  LNFloatingActionButton.swift
//  LNFloatingActionButton
//
//  Created by Shuhei Kawaguchi on 2016/11/26.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import UIKit
import QuartzCore


@objc public protocol LNFloatingActionButtonDataSource {
    func numberOfCells(_ floatingActionButton: LNFloatingActionButton) -> Int
    func cellForIndex(_ index: Int) -> LNFloatingActionButtonCell
}

@objc public protocol LNFloatingActionButtonDelegate {
    @objc optional func floatingActionButton(_ floatingActionButton: LNFloatingActionButton, didSelectItemAtIndex index: Int)
}


open class LNFloatingActionButton: UIView {
    open let imageView = UIImageView()
    // TODO: image after opening
    private var circleLayer: CAShapeLayer = CAShapeLayer()
    
    open var internalRatio: CGFloat = 0.75
    open var cellMargin: CGFloat = 10.0
    open var btnToCellMargin: CGFloat = 15.0
    
    open var size: CGFloat = 50 {
        didSet {
            frame.size = CGSize(width: size, height: size)
            resizeSubviews()
        }
    }
    open var color = UIColor(red: 0/255.0, green: 157/255.0, blue: 238/255.0, alpha: 1.0) {
        didSet {
            circleLayer.backgroundColor = color.cgColor
        }
    }
    open var responsible = true
    open fileprivate(set) var isClosed = true
    
    open var delegate:   LNFloatingActionButtonDelegate?
    open var dataSource: LNFloatingActionButtonDataSource?
    
    private var touching = false
    
    open var btnAnimationWithOpen: (LNFloatingActionButton) -> () = { $0.rotate45BtnAnimationWithOpen() }
    open var btnAnimationWithClose: (LNFloatingActionButton) -> () = { $0.rotate45BtnAnimationWithClose() }
    open var cellAnimationWithOpen: (LNFloatingActionButton) -> () = { $0.popCellAnimationWithOpen() }
    open var cellAnimationWothClose: (LNFloatingActionButton) -> () = { $0.popCellAnimationWithClose() }
    
    
    // MARK: - init
    public init(x: CGFloat, y: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: size, height: size))
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: -
    open override func draw(_ rect: CGRect) {
        responseCircle()
    }
    
    public func cells() -> [LNFloatingActionButtonCell] {
        var result: [LNFloatingActionButtonCell] = []
        guard let source = dataSource else { return result }
        
        for i in 0..<source.numberOfCells(self) {
            result.append(source.cellForIndex(i))
        }
        return result
    }
    
    public func open() {
        // TODO: remove cell
        btnAnimationWithOpen(self)
        cells().forEach { insert(cell: $0) }
        cellAnimationWithOpen(self)
        isClosed = false
    }
    
    public func close() {
        btnAnimationWithClose(self)
        cellAnimationWothClose(self)
        isClosed = true
    }
    
    
    // MARK: - Private
    private func setup() {
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = false
        setupCircleLayer()
        
        imageView.clipsToBounds = false
        self.addSubview(imageView)
        resizeSubviews()
    }
    
    private func resizeSubviews() {
        let size = CGSize(width: frame.width * 0.5, height: frame.height * 0.5)
        imageView.frame = CGRect(x: frame.width - frame.width * internalRatio, y: frame.height - frame.height * internalRatio,
                                 width: size.width, height: size.height)
    }
    
    private func responseCircle() {
        if touching && responsible {
            // TODO: Customize
            circleLayer.backgroundColor = color.withAlphaComponent(0.5).cgColor
        } else {
            circleLayer.backgroundColor = color.cgColor
        }
    }
    
    private func setupCircleLayer() {
        circleLayer.removeFromSuperlayer()
        circleLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        circleLayer.backgroundColor = color.cgColor
        circleLayer.cornerRadius = self.frame.size.width/2  // FIXME: when width != height
        layer.addSublayer(circleLayer)
    }
    
    private func insert(cell: LNFloatingActionButtonCell) {
        cell.alpha = 0
        cell.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        cell.actionButton = self
        self.addSubview(cell)
    }
    
    
    // MARK: - Action
    private func didTap() {
        isClosed ? open() : close()
    }
    
    func didTap(cell: LNFloatingActionButtonCell) {
        guard let _ = dataSource else { return }
        cells().enumerated()
            .filter { $1 === cell }
            .forEach { index, _ in delegate?.floatingActionButton?(self, didSelectItemAtIndex: index) }
    }
    
    
    // MARK: - Event
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touching = true
        setNeedsDisplay()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touching = false
        setNeedsDisplay()
        didTap()
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        self.touching = false
        setNeedsDisplay()
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for cell in cells() {
            let pointForTargetView = cell.convert(point, from: self)
            
            if (cell.bounds.contains(pointForTargetView)) {
                if cell.isUserInteractionEnabled {
                    return cell.hitTest(pointForTargetView, with: event)
                }
            }
        }
        
        return super.hitTest(point, with: event)
    }
}


// MARK: - animation
extension LNFloatingActionButton {
    public func popCellAnimationWithOpen() {
        var cellHeight = btnToCellMargin
        var delay = 0.0
        cells().forEach { cell in
            cellHeight += cell.size + cellMargin
            cell.frame.origin.y = -cellHeight
            cell.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
            UIView.animate(withDuration: 0.3, delay: delay, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.3,
                           options: UIViewAnimationOptions(),
                           animations: { _ in
                            cell.layer.transform = CATransform3DIdentity
                            cell.alpha = 1
            }, completion: nil)
            delay += 0.1
        }
    }
    
    public func popCellAnimationWithClose() {
        var delay = 0.0
        cells().forEach { cell in
            UIView.animate(withDuration: 0.15, delay: delay, options: UIViewAnimationOptions(), animations: { _ in
                cell.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
                cell.alpha = 0
            }, completion: nil)
            delay += 0.1
        }
    }
    
    public func rotate45BtnAnimationWithOpen() {
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI) * 45.0 / 180.0)
        }
    }
    
    public func rotate45BtnAnimationWithClose() {
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI) * 0 / 180.0)
        }
    }
}
