//
//  objc_Extend.swift
//  Hey
//
//  Created by 张飞 on 2019/9/5.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit

fileprivate var cellIdentifierKeyOption = "cellIdentifierKey"
fileprivate var cellHeightKeyOption = "cellHeightKey"


extension NSObject {
    
    var cellIdentifierOption: String? {
        set {
            objc_setAssociatedObject(self, &cellIdentifierKeyOption, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &cellIdentifierKeyOption) as? String
        }
    }
    
    var cellHeightOption:CGFloat?{
        set {
            objc_setAssociatedObject(self, &cellHeightKeyOption, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        
        get {
            return objc_getAssociatedObject(self, &cellHeightKeyOption) as? CGFloat
        }
    }

}


