//
//  HYBaseTableDegelate.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseTableViewDegelate: NSObject {
    
    public var didScrollCallBack:didScrollCallBack?
    public var dataSourceModel:dataSourceModelCallBack?
  
}

extension HYBaseTableViewDegelate:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = dataSourceModel?(indexPath)
        var baseCellHeight:CGFloat = 0
        
        if let modelInfo = model{
            
            baseCellHeight = HYBaseCellTool.getCurrentBaseCellHeight(tableView: tableView, indexPath: indexPath, model: modelInfo)
            
        }
        
        return baseCellHeight
    }
    
}


extension HYBaseTableViewDegelate:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
        if let callBack = didScrollCallBack{
            callBack(scrollView)
        }
        
    }
    
}


