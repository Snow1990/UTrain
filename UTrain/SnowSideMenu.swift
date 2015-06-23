//
//  SnowSideMenu.swift
//  UTrain
//
//  Created by SN on 15/6/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

@objc protocol SnowSideMenuDelegate {
    optional func sideMenuWillOpen()
    optional func sideMenuWillClose()
    optional func sideMenuShouldOpenSideMenu () -> Bool
}
@objc protocol SnowSideMenuProtocol {
    var sideMenu : SnowSideMenu? { get }
}

enum SnowSideMenuPosition : Int {
    case Left
    case Right
}

enum SnowSideMenuAnimation : Int {
    case None
    case Default
}

class SnowSideMenu: NSObject, UIGestureRecognizerDelegate {
    var menuWidth: CGFloat = 180
    var menuPosition: SnowSideMenuPosition = .Left
    var bounces: Bool = false
    var animationDuration = 0.4
    var delegate: SnowSideMenuDelegate?
    var allowLeftSwipe = true
    var allowRightSwipe = true
    
    private var menuViewController: UIViewController!
    private var animator: UIDynamicAnimator!
    private var sideMenuView = UIView()
    private var sourceView: UIView!
    private var needUpdateApperence:Bool = false
    private var isMenuOpen: Bool = false
    
    
    init(sourceView: UIView, menuPosition: SnowSideMenuPosition) {
        super.init()
        self.sourceView = sourceView
        self.menuPosition = menuPosition
        self.setupMenuView()
        
        animator = UIDynamicAnimator(referenceView: sourceView)
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleGesture:")
//        tapGestureRecognizer.delegate = self
//        sourceView.addGestureRecognizer(tapGestureRecognizer)
        
        // 右滑手势
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleGesture:")
        rightSwipeGestureRecognizer.delegate = self
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        sourceView.addGestureRecognizer(rightSwipeGestureRecognizer)
        
        // 左滑手势
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleGesture:")
        leftSwipeGestureRecognizer.delegate = self
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        sourceView.addGestureRecognizer(leftSwipeGestureRecognizer)
        
//        if menuPosition == .Left {
//            
//            let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleGesture:")
//            rightSwipeGestureRecognizer.delegate = self
//            rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
//            sourceView.addGestureRecognizer(rightSwipeGestureRecognizer)
//        }else {
//            
//            let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleGesture:")
//            leftSwipeGestureRecognizer.delegate = self
//            leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
//            sourceView.addGestureRecognizer(leftSwipeGestureRecognizer)
//        }
        
    }
    convenience init(sourceView: UIView, menuViewController: UIViewController, menuPosition: SnowSideMenuPosition) {
        self.init(sourceView: sourceView, menuPosition: menuPosition)
        self.menuViewController = menuViewController
        self.menuViewController.view.frame = sideMenuView.bounds
        self.menuViewController.view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        sideMenuView.addSubview(self.menuViewController.view)
    }
    
    convenience init(sourceView: UIView, view: UIView, menuPosition: SnowSideMenuPosition) {
        self.init(sourceView: sourceView, menuPosition: menuPosition)
        view.frame = sideMenuView.bounds
        view.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        sideMenuView.addSubview(view)
    }
    
    func updateFrame() {
        var width: CGFloat = sourceView.frame.size.width
        var hight: CGFloat = sourceView.frame.size.height
        let menuFrame = CGRectMake(
            (menuPosition == .Left) ?
                isMenuOpen ? 0 : -menuWidth-1.0 :
                isMenuOpen ? width - menuWidth : width + 1.0,
            sourceView.frame.origin.y,
            menuWidth,
            hight)
        sideMenuView.frame = menuFrame
    }
    
    func setupMenuView() {
        
        updateFrame()
        
        sideMenuView.backgroundColor = UIColor.clearColor()
        sideMenuView.clipsToBounds = false
//        sideMenuView.layer.masksToBounds = false
//        sideMenuView.layer.shadowOffset = (menuPosition == .Left) ? CGSizeMake(1.0, 1.0) : CGSizeMake(-1.0, -1.0)
//        sideMenuView.layer.shadowRadius = 1.0
//        sideMenuView.layer.shadowOpacity = 0.125
//        sideMenuView.layer.shadowPath = UIBezierPath(rect: sideMenuView.bounds).CGPath
        sourceView.addSubview(sideMenuView)
        
        
        
        
        
    }
    
    // 手势处理
    func handleGesture(gestureRecognizer: UIGestureRecognizer) {
        
        if let swipeGestureRecognizer = gestureRecognizer as? UISwipeGestureRecognizer {
            toggleMenu(self.menuPosition == .Right && swipeGestureRecognizer.direction == .Left
                || self.menuPosition == .Left && swipeGestureRecognizer.direction == .Right)
        
        }
//        if let tapGestureRecognizer = gestureRecognizer as? UITapGestureRecognizer {
//            toggleMenu(false)
//        }
        
    }
    
    
    // Menu开关
    func toggleMenu() {
        if isMenuOpen {
            toggleMenu(false)
        }else {
            updateSideMenuApperanceIfNeeded()
            toggleMenu(true)
        }
    }
    
    func toggleMenu(shouldOpen: Bool){
        
        if (shouldOpen && delegate?.sideMenuShouldOpenSideMenu?() == false) {
            return
        }
        
        updateSideMenuApperanceIfNeeded()
        isMenuOpen = shouldOpen
        var width: CGFloat = sourceView.frame.size.width
        var hight: CGFloat = sourceView.frame.size.height
        if bounces {
            animator.removeAllBehaviors()
            
            var gravityDirectionX: CGFloat
            var pushMagnitude: CGFloat
            var boundaryPointX: CGFloat
            var boundaryPointY: CGFloat
            
            if (menuPosition == .Left) {
                // Left side menu
                gravityDirectionX = (shouldOpen) ? 1 : -1
                pushMagnitude = (shouldOpen) ? 20 : -20
                boundaryPointX = (shouldOpen) ? menuWidth : -menuWidth-2
                boundaryPointY = 20
            }
            else {
                // Right side menu
                gravityDirectionX = (shouldOpen) ? -1 : 1
                pushMagnitude = (shouldOpen) ? -20 : 20
                boundaryPointX = (shouldOpen) ? width-menuWidth : width+menuWidth+2
                boundaryPointY =  -20
            }
            
            let gravityBehavior = UIGravityBehavior(items: [sideMenuView])
            gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX,  0)
            animator.addBehavior(gravityBehavior)
            
            let collisionBehavior = UICollisionBehavior(items: [sideMenuView])
            collisionBehavior.addBoundaryWithIdentifier("menuBoundary", fromPoint: CGPointMake(boundaryPointX, boundaryPointY),
                toPoint: CGPointMake(boundaryPointX, hight))
            animator.addBehavior(collisionBehavior)
            
            let pushBehavior = UIPushBehavior(items: [sideMenuView], mode: UIPushBehaviorMode.Instantaneous)
            pushBehavior.magnitude = pushMagnitude
            animator.addBehavior(pushBehavior)
            
            let menuViewBehavior = UIDynamicItemBehavior(items: [sideMenuView])
            menuViewBehavior.elasticity = 0.25
            animator.addBehavior(menuViewBehavior)

        }
        
        else {
            var destFrame :CGRect
            if (menuPosition == .Left) {
                destFrame = CGRectMake((shouldOpen) ? -2.0 : -menuWidth, 0, menuWidth, hight)
            }
            else {
                destFrame = CGRectMake((shouldOpen) ? width-menuWidth : width+2.0,
                    0,
                    menuWidth,
                    hight)
            }
            
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                self.sideMenuView.frame = destFrame
            })
        }

        if (shouldOpen) {
            delegate?.sideMenuWillOpen?()
        } else {
            delegate?.sideMenuWillClose?()
        }
        
    }
    
    func updateSideMenuApperanceIfNeeded() {
        if needUpdateApperence {
            var frame = sideMenuView.frame
            frame.size.width = menuWidth
            sideMenuView.frame = frame
            sideMenuView.layer.shadowPath = UIBezierPath(rect: sideMenuView.bounds).CGPath
            needUpdateApperence = false
        }
    }
    
    // 显示抽屉栏
    func showSideMenu() {
        if !isMenuOpen {
            toggleMenu(true)
        }
    }
    
    // 隐藏抽屉栏
    func hideSideMenu() {
        if isMenuOpen {
            toggleMenu(false)
        }
    }
    
    
    // MARK : - 手势委托
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let swipeGestureRecognizer = gestureRecognizer as? UISwipeGestureRecognizer {
            if !allowLeftSwipe {
                if swipeGestureRecognizer.direction == .Left {
                    return false
                }
            }
            if !allowRightSwipe {
                if swipeGestureRecognizer.direction == .Right {
                    return false
                }
            }
        }
        
//        if gestureRecognizer is UISwipeGestureRecognizer {
//            if let swipeGestureRecognizer = gestureRecognizer as? UISwipeGestureRecognizer {
//                if !allowLeftSwipe {
//                    if swipeGestureRecognizer.direction == .Left {
//                        return false
//                    }
//                }
//                if !allowRightSwipe {
//                    if swipeGestureRecognizer.direction == .Right {
//                        return false
//                    }
//                }
//            }
//        }
        return true
    }
    
    
    
    
    
    
    
    
    
    
}