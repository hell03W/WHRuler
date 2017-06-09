//
//  WHRulerScrollView.swift
//  WHRuler
//
//  Created by Walden on 17/4/17.
//  Copyright © 2017年 Walden. All rights reserved.
//

import UIKit

protocol SweetRulerDelegate: NSObjectProtocol {
    ///刻度尺代理方法
    func sweetRuler(ruler: SweetRuler, figure: Int)
}

class SweetRuler: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 懒加载rlerView, 并进行简单配置
    lazy var rulerView = { () -> RulerView in
        let rulerView = RulerView()
        return rulerView
    }()
    
    /// 懒加载 scrollView
    lazy var scrollView = { () -> UIScrollView in
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    /// 中间的红色的指示线
    lazy var middleLine = { () -> UIView in
        let line = UIView()
        line.backgroundColor = UIColor.red
        return line
    }()
    
    func configUI() {
        
        backgroundColor = UIColor.white
        
        addSubview(scrollView)
        scrollView.addSubview(rulerView)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.decelerationRate = 0.3   //降低手指离开屏幕后scrollView的滚动速度
        
        scrollView.delegate = self
        
        
        // middleLine
        addSubview(middleLine)
        
    }
    
    weak var delegate: SweetRulerDelegate?
    
    /// 刻度尺表示的范围
    var figureRange = Range(uncheckedBounds: (1000,10000))
    /// 尺子的长度
    var rulerLength: Double = 300
    /// 刻度的宽度, 刻度之间的间隔
    var dialBlank: Double = 10.0
    /// 刻度分割最小的高度
    var dialMinHeight: Double = 8
    /// 刻度分割最大的高度
    var dialMaxHeight: Double = 13
    /// 刻度的颜色
    var dialColor: UIColor = UIColor.gray
    /// 每个刻度表示的宽度
    var dialSpan: Int = 100
    /// 文字颜色
    var textColor: UIColor = UIColor.lightGray
    
    private var selectFigure: Int = 0
    func setSelectFigure(figure: Int) {
        selectFigure = figure
        
        let x = Double((selectFigure - figureRange.upperBound) / dialSpan) * dialBlank
        let offset = CGPoint(x: x, y: 0)
        scrollView.setContentOffset(offset, animated: false)
        calcTargetOffset(scrollView: scrollView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //
        scrollView.frame = bounds
        middleLine.frame = CGRect(x: frame.size.width/2, y: 0, width: 1, height: frame.size.height)
        
        centerX = Double(frame.size.width/2)
        let height = Double(Double(frame.size.height) - rulerView.dialMaxHeight)
        rulerView.frame = CGRect(x: centerX!, y: height, width: rulerView.rulerLength, height: rulerView.dialMaxHeight)
        
        rulerView.dialRange = figureRange
        rulerView.rulerLength = rulerLength
        rulerView.dialBlank = dialBlank
        rulerView.dialMinHeight = dialMinHeight
        rulerView.dialMaxHeight = dialMaxHeight
        rulerView.dialColor = dialColor
        rulerView.dialSpan = dialSpan
        rulerView.textColor = textColor
        
        rulerView.displayRuler()
        
        scrollView.contentSize = CGSize(width: rulerView.rulerLength + Double(frame.size.width), height: 30.0)
        
        //设置起始位置
        let x = Double((selectFigure - figureRange.lowerBound) / dialSpan) * dialBlank
        let offset = CGPoint(x: x, y: 0)
        scrollView.setContentOffset(offset, animated: false)
        calcTargetOffset(scrollView: scrollView)
        
        print("contentSize: \(scrollView.contentSize)")
        print("rulerView.frame: \(rulerView.frame)")
    }
    
    // 当前的中点
    var currentPoint: Double?
    var centerX: Double?
    
    
}


extension SweetRuler: UIScrollViewDelegate {
    
    // 拖拽结束走的方法
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        calcTargetOffset(scrollView: scrollView)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        calcTargetOffset(scrollView: scrollView)
    }
    
    
    
    /// 拖拽结束后, 重新计算应该滑动到的位置, 并用动画滑动到指定位置
    func calcTargetOffset(scrollView: UIScrollView) {
        
        let targetOffset = rulerView.closestOffset(offset: scrollView.contentOffset)
        scrollView.setContentOffset(targetOffset, animated: true)
        
        var figure = rulerView.calcCurrentFigure(offset: targetOffset)
        if figure < figureRange.lowerBound {
            figure = figureRange.lowerBound
        }
        if figure > figureRange.upperBound {
            figure = figureRange.upperBound
        }
        delegate?.sweetRuler(ruler: self, figure: figure)
    }
    
}












