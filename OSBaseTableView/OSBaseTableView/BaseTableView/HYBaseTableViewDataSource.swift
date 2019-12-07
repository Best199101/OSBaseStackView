//
//  HYTableViewDataSource.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseTableViewDataSource: NSObject {
    
      public var dataSourceCount:dataSourceCountCallBack?
      public var dataSourceModel:dataSourceModelCallBack?
    
}

extension HYBaseTableViewDataSource:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourceCount?(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = dataSourceModel?(indexPath)
        
        if let modelInfo = model{
            
            return HYBaseCellTool.getCurrentBaseCell(tableView: tableView, indexPath: indexPath, model: modelInfo)
            
        }
        
        return UITableViewCell()
        
    }
    
    
}
