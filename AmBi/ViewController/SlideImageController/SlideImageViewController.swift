//
//  SlideImageViewController.swift
//  AmBi
//
//  Created by Dreamup on 12/13/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import FSPagerView
import Kingfisher

protocol pushImageWhenBack {
    func pushImage(image:UIImage)
}

class SlideImageViewController: UIViewController {

    var pushImage:pushImageWhenBack?
    var pagerView: FSPagerView!
     var urlList = [String]()
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var pageViewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    @IBOutlet var viewAnimation: UIView!
    

    @IBAction func btnBack(_ sender: Any) {
        if let image = UIImage.init(named: "ic_candy_woman") {
            pushImage?.pushImage(image: image)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func setupUI(){
        
        urlList.append("https://i-ngoisao.vnecdn.net/2017/12/12/DSC9280-1-1507298103-680x0-9557-1513077247.jpg")
        urlList.append("https://i-ngoisao.vnecdn.net/2017/12/12/DSC-5551-1600x1067-JPG-9772-14-4391-2999-1513077247.jpg")
        urlList.append("https://i-ngoisao.vnecdn.net/2017/12/12/Thu-Ngan-1-7756-1513077247.jpg")
        
        pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 9 / 16))
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.transformer = FSPagerViewTransformer(type: .ferrisWheel)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.interitemSpacing = 10
        pagerView.automaticSlidingInterval = 2.0
        
        pageViewContainer.addSubview(pagerView)
        
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.numberOfPages = urlList.count
        
        makeAnimationForView()
    }
    
    func makeAnimationForView(){
        UIView.animate(withDuration: 1, animations: {
            self.viewAnimation.backgroundColor = .brown
            self.viewAnimation.frame.size.width += 10
            self.viewAnimation.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0.5, options: [.autoreverse, .repeat], animations: {
                self.viewAnimation.frame.origin.y -= 20
                
            })
        }
    }
    
}

extension SlideImageViewController : FSPagerViewDataSource,FSPagerViewDelegate{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return urlList.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.contentMode = .scaleAspectFill
        
        cell.imageView?.kf.setImage(with: URL(string: urlList[index]))
        
        return cell
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let detailImageVC = DetailImageViewController.init(nibName: "DetailImageViewController", bundle: nil)
        detailImageVC.urlOfImage = urlList[pagerView.currentIndex]
        navigationController?.pushViewController(detailImageVC, animated: true)
        
    }
    
}
