//
//  AVPlayerView.swift
//  DangerousButton
//
//  Created by Takayama on 2015/04/28.
//  Copyright (c) 2015年 Hiroshi Takayama. All rights reserved.
//

import AVFoundation
import UIKit

// レイヤーをAVPlayerLayerにする為のラッパークラス.
class AVPlayerView: UIView{
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override class func layerClass() -> AnyClass{
        return AVPlayerLayer.self
    }
}