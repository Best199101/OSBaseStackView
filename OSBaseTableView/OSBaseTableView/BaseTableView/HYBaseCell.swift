//
//  HYBaseCell.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit

class HYBaseCell: UITableViewCell {
    
    public static let HYBaseCellAction = "HYBaseCellAction"
    public static let HYBaseCellHeaderAction = "HYBaseCellHeaderAction"
    public static let HYBaseCellTagAction = "HYBaseCellTagAction"
    public static let HYBaseCellRoomAction = "HYBaseCellRoomAction"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadPrivateSubviews()
        layoutPrivateSubviews()
    }
    
    override func loadPrivateSubviews() {
//        self.contentView.backgroundColor = HY_Color_TableViewCell
        self.selectionStyle = .none
        
    }
    override func layoutPrivateSubviews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension HYBaseCell:HYBaseCellProtocol{
    
    @objc func setCellData(_ model: HYBaseCell.U) {
        
    }
    
}

extension HYBaseCell{
    
    public static var cellIdentifier:String {
        
        get{
            return NSStringFromClass(self.classForCoder())
        }
    }
    
}
