//
//  Card.swift
//  CardGameSwift
//
//  Created by 郭家政 on 2017/3/30.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import Foundation
import UIKit

class Card: UIButton {
	private var _title = ""
	private var _textColor = ""
	private var _isFront: Bool = false
	private var _isMatched: Bool = false

	public func InitCard(title: String, color: String) -> Void {
		self._title = title
		self._textColor = color

		// 關閉按鈕功能
		self.isEnabled = false

		// 配置按下時的要觸發的事件
		self.addTarget(self, action: #selector(self.FlipCard), for: .touchUpInside)
	}

	public func GetTitle() -> String {
		return self._title
	}

	//	是否為正面
	public func IsCardFront() -> Bool {
		return self._isFront
	}

	// 定義翻牌事件
	public func FlipCard() -> Void {
		if self.currentTitle == nil {
			self.setTitle("", for: UIControlState.normal)
		}

		if (!self._isFront) {
			self.setBackgroundImage(UIImage(named: "CardBack"), for: UIControlState.normal)
			self.setTitle("", for: UIControlState.normal)
		} else {
			self.setBackgroundImage(UIImage(named: "CardFront"), for: UIControlState.normal)
			self.setTitle(self._title, for: UIControlState.normal)
		}

		self._isFront = !self._isFront
	}

	// 在畫面上產生卡片
	public func GenerateCard(x: Int, y: Int, view: UIViewController) -> Void {
		// 取得螢幕的尺寸
		let fullScreenSize = UIScreen.main.bounds.size

		// 間距
		let gutterX: Double = 15
		let gutterY: Double = 15

		// 寬高
		let cardWdith: Double = Double(fullScreenSize.width) / 4 - gutterX
		let cardHeight: Double = 100

		// 位置
		let cardPositionX: Double = Double(x) * cardWdith + Double(x) * gutterX + gutterX * 0.5
		let cardPositionY: Double = Double(y) * cardHeight + Double(y) * gutterY + 20

		// 指定 UIButton 外框
		self.frame = CGRect(x: cardPositionX, y: cardPositionY, width: cardWdith, height: cardHeight)

		// 卡牌文字
		self.setTitle(self._title, for: UIControlState.normal)


		// 卡牌文字顏色
		if self._textColor == "red" {
			self.setTitleColor(UIColor.red, for: UIControlState.normal)
		} else {
			self.setTitleColor(UIColor.black, for: UIControlState.normal)
		}

		// 使用者按下時有動畫效果
		self.isUserInteractionEnabled = true

		// 卡牌背景
		self.setBackgroundImage(UIImage(named: "CardFront"), for: UIControlState.normal)

		// 將卡牌加入畫面
		view.view.addSubview(self)
	}
}
