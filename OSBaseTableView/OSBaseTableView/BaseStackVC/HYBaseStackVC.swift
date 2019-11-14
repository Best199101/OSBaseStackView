//
//  HYBaseStackVC.swift
//  Hey
//
//  Created by 张飞 on 2019/9/2.
//  Copyright © 2019 Giant Inc. All rights reserved.
//

import UIKit
import Masonry

typealias indexCallBack = (_ index:UInt) -> Void
typealias enableMulScrollCallBack = () -> Bool

class HYBaseStackVC: HYBaseVC {
    
    public var dataSource:[HYBaseStackModel] = []
    public var subChildVCPool:[String:HYBaseVC] = [:]

    fileprivate var listCollectionView:HYBaseStackCollectionView!
    
    public var currentIndex:Int = 0{
        
        didSet{
            
            self.listCollectionView.setContentOffset(CGPoint(x: CGFloat(currentIndex) * HYScreenWidth, y: 0), animated: true)
            
        }
        
    }
    
    public var indexCallBack:indexCallBack?
    public var enableMulScrollCallBack:enableMulScrollCallBack?
    

    deinit {
        
        for child in self.children{
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func loadPrivateSubviews() {
        
        let frameSize = self.view.bounds.size
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = frameSize
        flowlayout.minimumLineSpacing = 0
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        listCollectionView = HYBaseStackCollectionView(
            frame: CGRect.zero,
            collectionViewLayout: flowlayout)
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.enableMulScrollCallBack = enableMulScrollCallBack
        view.addSubview(listCollectionView)
    
    }
    
    override func layoutPrivateSubviews() {
        
        listCollectionView.mas_makeConstraints { (make) in
            
            make?.edges.mas_equalTo()(self.view)
        }
        
    }
    
    override func loadPrivateData() {
        
        listCollectionView.reloadData()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HYBaseStackVC{
    
    public func reloadSubChildVC(subChild:[HYBaseStackModel]){
        
        dataSource.removeAll()

        for item in subChild{
         
            item.cellIdentifierOption = HYBaseStackCell.cellIdentifier
            
            if let stackSubTitle = item.subTitle,let stackSubVC = item.subVC {
                
                if let value = subChildVCPool[stackSubTitle]{
                    item.subVC = value
                    dataSource.append(item)
                    
                }else{
                    dataSource.append(item)
                    subChildVCPool[stackSubTitle] = stackSubVC
                    self.addChild(stackSubVC)
                }
                
            }
            
        }
        
    }
    
    
    
}



extension HYBaseStackVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == listCollectionView{
            
            
            if scrollView.isTracking || scrollView.isDragging || scrollView.isDecelerating{
                
                let index = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5
                
                let Ind = UInt(index)
                
                if let callBack = self.indexCallBack{
                    
                    callBack(Ind)
                    
                }
                
            }
      
        }
    }
    
}



extension HYBaseStackVC:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let counts = dataSource.count
        return counts
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        
        let subModel = dataSource[indexPath.row]
        
        let cell = HYBaseCollectionCellTool.getCurrentBaseCell(collectionView: collectionView, indexPath: indexPath, model: subModel)
        
        return cell
        
    }
    
}


