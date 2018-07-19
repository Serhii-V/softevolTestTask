//
//  dropDownButton.swift
//  softevolTask
//
//  Created by Serhii on 7/18/18.
//  Copyright © 2018 Serhii. All rights reserved.
//

import UIKit

class DropDownButton: UIButton {

    var dropView = DropDownView()
//    var height = NSLayoutConstraint()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.lightGray
//        dropView = DropDownView(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: 0))
//        dropView.translatesAutoresizingMaskIntoConstraints = false

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func didMoveToSuperview() {
//        self.superview?.addSubview(dropView)
//        self.superview?.bringSubview(toFront: dropView)

        //dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        //height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }

    

//    var isOpen = false {
//        didSet {
//            self.imageView?.image = isOpen ? #imageLiteral(resourceName: "button_more") : #imageLiteral(resourceName: "button_more_filled")
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if isOpen {
//
//
//            let frame = CGRect(x: 200, y: 200, width: 200, height: 200)
//
//            dropView.frame = frame
////            NSLayoutConstraint.deactivate([self.height])
////            //self.height.constant = 0
////            NSLayoutConstraint.activate([self.height])
////            UIView.animate(withDuration: 0.5, animations: {
////                self.dropView.layoutIfNeeded()
////            }, completion: nil)
//        } else {
//            let frame = CGRect(x: 200, y: 200, width: 200, height: 0)
//
//            dropView.frame = frame
//
////            NSLayoutConstraint.deactivate([self.height])
////            //self.height.constant = 90
////            NSLayoutConstraint.activate([self.height])
////            UIView.animate(withDuration: 0.5, animations: {
////                self.dropView.layoutIfNeeded()
////            }, completion: nil)
//        }
//        isOpen = !isOpen
//    }
//
//}
