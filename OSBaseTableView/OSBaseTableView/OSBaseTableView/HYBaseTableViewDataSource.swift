//
//  HYTableViewDataSource.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseTableViewDataSource: NSObject {
    
    public var dataSource:[NSObject] = []
    
}

extension HYBaseTableViewDataSource:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let model = dataSource[row]
        
        let baseCell = HYBaseCellTool.getCurrentBaseCell(tableView: tableView, indexPath: indexPath, model: model)
        
        return baseCell
    
    }
    
    
}
