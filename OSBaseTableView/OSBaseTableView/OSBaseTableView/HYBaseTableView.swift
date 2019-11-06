//
//  HYBaseTableView.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

typealias didScrollCallBack = (_ scrollView:UIScrollView) -> Void


class HYBaseTableView: UITableView {
    
    public var count:Int32 = 20
    public var offset:Int32 = 0
    public var didScrollCallBack:didScrollCallBack?

    public var dataSourceArr: [NSObject] = [] {
        willSet {
            self.baseDataSource.dataSource = newValue
            self.baseDegelete.dataSource = newValue
        }
        
        didSet{
            self.reloadData()
        }
    }
    

    fileprivate lazy var baseDegelete:HYBaseTableViewDegelate = {
        
        let degelete = HYBaseTableViewDegelate()
        degelete.callBack = { [weak self] offset in
            
            guard let strongSelf = self,let block = strongSelf.didScrollCallBack else{
                return
            }

            block(offset)
            
        }
        
        return degelete
    
    }()
    
    fileprivate lazy var baseDataSource:HYBaseTableViewDataSource = {
        
        let dataSource = HYBaseTableViewDataSource()
        
        return dataSource
        
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        loadPrivateSubviews()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadPrivateSubviews() {

        self.separatorStyle = .none
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.estimatedRowHeight = 0
        
        self.delegate = baseDegelete
        self.dataSource = baseDataSource
        
    }
 
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
