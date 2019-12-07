//
//  HYBaseCollectionViewDataSource.swift
//  Hey
//
//  Created by 张飞 on 2019/11/10.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import Foundation
import UIKit

class HYBaseCollectionViewDataSource: NSObject {
    
    public var dataSourceCount:dataSourceCountCallBack?
    public var dataSourceModel:dataSourceModelCallBack?
    
}

extension HYBaseTableViewDataSource:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSourceCount?(section) ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = dataSourceModel?(indexPath)
        
        if let modelInfo = model{
            
            let baseCell = HYBaseCollectionCellTool.getCurrentBaseCell(collectionView: collectionView, indexPath: indexPath, model: model)
            
        }
    
        return UICollectionViewCell()
        
    }


}
