//
//  ViewController.swift
//  ConstraintsAnimation
//
//  Created by Muhammad Hassan on 30/11/2016.
//  Copyright © 2016 Muhammad Hassan. All rights reserved.
//

import UIKit
import UICountingLabel

class ViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var magentaView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var cyanViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var magentaViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var blackViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cyanWidthLabel: UICountingLabel!
    @IBOutlet weak var cyanHeightLabel: UICountingLabel!
    @IBOutlet weak var magentaWidthLabel: UICountingLabel!
    @IBOutlet weak var magentaHeightLabel: UICountingLabel!
    @IBOutlet weak var yellowWidthLabel: UICountingLabel!
    @IBOutlet weak var yellowHeightLabel: UICountingLabel!
    @IBOutlet weak var blackWidthLabel: UICountingLabel!
    @IBOutlet weak var blackHeightLabel: UICountingLabel!
    
    //MARK:- Instance members
    var standardHeight: CGFloat {
        get {
            return (self.view.bounds.size.height - 20) / 4.0
        }
    }
    
    var extendedHeight: CGFloat {
        get {
            return (self.view.bounds.size.height - 20) / 2.0
        }
    }
    
    var compactHeight: CGFloat {
        get {
            return ((self.view.bounds.size.height - 20) - extendedHeight) / 3.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture
        cyanView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap(_:))))
        magentaView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap(_:))))
        yellowView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap(_:))))
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap(_:))))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
    }
    
    func viewDidTap(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        switch tappedView {
        case cyanView:
            cyanViewHeightConstraint.constant = extendedHeight
            resetViews(cyanViewHeightConstraint)
        case magentaView:
            magentaViewHeightConstraint.constant = extendedHeight
            resetViews(magentaViewHeightConstraint)
        case yellowView:
            yellowViewHeightConstraint.constant = extendedHeight
            resetViews(yellowViewHeightConstraint)
        case blackView:
            blackViewHeightConstraint.constant = extendedHeight
            resetViews(blackViewHeightConstraint)
        default:
            break
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        cyanHeightLabel.countFromCurrentValue(to: cyanViewHeightConstraint.constant)
        magentaHeightLabel.countFromCurrentValue(to: magentaViewHeightConstraint.constant)
        yellowHeightLabel.countFromCurrentValue(to: yellowViewHeightConstraint.constant)
        blackHeightLabel.countFromCurrentValue(to: blackViewHeightConstraint.constant)
    }
    
    func setupViews() {
        cyanWidthLabel.format = "W: %d"
        magentaWidthLabel.format = "W: %d"
        yellowWidthLabel.format = "W: %d"
        blackWidthLabel.format = "W: %d"
        
        cyanHeightLabel.format = "H: %d"
        magentaHeightLabel.format = "H: %d"
        yellowHeightLabel.format = "H: %d"
        blackHeightLabel.format = "H: %d"
        
        cyanWidthLabel.countFromZero(to: cyanView.bounds.width)
        cyanHeightLabel.countFromZero(to: cyanViewHeightConstraint.constant)
        
        magentaWidthLabel.countFromZero(to: magentaView.bounds.width)
        magentaHeightLabel.countFromZero(to: magentaViewHeightConstraint.constant)
        
        yellowWidthLabel.countFromZero(to: yellowView.bounds.width)
        yellowHeightLabel.countFromZero(to: yellowViewHeightConstraint.constant)
        
        blackWidthLabel.countFromZero(to: blackView.bounds.width)
        blackHeightLabel.countFromZero(to: blackViewHeightConstraint.constant)
        
        for constraint in [cyanViewHeightConstraint, magentaViewHeightConstraint, yellowViewHeightConstraint, blackViewHeightConstraint] {
            constraint!.constant = standardHeight
        }
    }
    
    func resetViews(_ heightConstraint: NSLayoutConstraint) {
        for constraint in [cyanViewHeightConstraint, magentaViewHeightConstraint, yellowViewHeightConstraint, blackViewHeightConstraint].filter({ $0 != heightConstraint }) {
            constraint!.constant = compactHeight
        }
    }
}

