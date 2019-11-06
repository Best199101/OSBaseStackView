//
//  UIResponder_UIExtend
//  Hey
//
//  Created by 张飞 on 2019/7/31.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIResponder{
    
    @objc func loadPrivateSubviews() {
        
    }
    
    @objc func layoutPrivateSubviews() {
        
    }
    
    @objc func loadPrivateData() {
        
    }
    
    @objc func loadPrivateMoreData() {
        
    }
    
    @objc func loadPrivateNotify(){
        
    }
    
    @objc func routerResponderEvent(eventName actionName:String?,userInfo params:[AnyHashable:AnyHashable]?){
        
        next?.routerResponderEvent(eventName: actionName, userInfo: params)
        
    }
    
}

