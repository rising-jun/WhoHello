//
//  ImageScrollDelegate.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/29.
//

import Foundation
import UIKit


class ImageScrollDelegate: NSObject{
    
    lazy var imageCount: Int = 0
    var pageControl: UIPageControl!
    
    init(pageControl: UIPageControl) {
        self.pageControl = pageControl
    }
    
}
extension ImageScrollDelegate: UIScrollViewDelegate{
    
    private func setPageControl() {
        pageControl.numberOfPages = imageCount
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    
    
}
