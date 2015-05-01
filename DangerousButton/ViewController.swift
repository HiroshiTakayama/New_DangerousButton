//
//  ViewController.swift
//  DangerousButton
//
//  Created by Takayama on 2015/04/26.
//  Copyright (c) 2015年 Hiroshi Takayama. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia
import CoreData

class ViewController: UIViewController {
    
    var hairetu = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var result = [Int]()
    
    var moveView1: UIImageView!
    var moveView2: UIImageView!
    var moveView3: UIImageView!
    var moveView4: UIImageView!
    var moveView5: UIImageView!
    var moveView6: UIImageView!
    var moveView7: UIImageView!
    var moveView8: UIImageView!
    var moveView9: UIImageView!
    var moveView10: UIImageView!
    var moveView11: UIImageView!
    var moveView12: UIImageView!
    var moveView13: UIImageView!
    var moveView14: UIImageView!
    var moveView15: UIImageView!
    var moveView16: UIImageView!
    var moveView17: UIImageView!
    var moveView18: UIImageView!
    var moveView19: UIImageView!
    var moveView20: UIImageView!
    
    var playerItem: AVPlayerItem!
    var videoPlayer: AVPlayer!
    var videoPlayerView: AVPlayerView!
    var gameoverButton: UIButton!
    
    
    @IBAction func pushButton(sender: UIButton) {
        
        var cnt = hairetu.count
        println("押されたボタンのタグは\(sender.tag)番です)")
        println("押されたボタンの透明度は\(sender.alpha)です")
        
        
        
        let sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("switch01", ofType: "mp3")!)
        var audioPlayer: AVAudioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil)
        audioPlayer.play()

        
        
        // ここから爆発の映像に切り替える
        // パスからassetを生成.
        let path = NSBundle.mainBundle().pathForResource("bakuha", ofType: "mov")
        let fileURL = NSURL(fileURLWithPath: path!)
        let avAsset = AVURLAsset(URL: fileURL, options: nil)
        
        // AVPlayerに再生させるアイテムを生成.
        self.playerItem = AVPlayerItem(asset: avAsset)
        
        // AVPlayerを生成.
        self.videoPlayer = AVPlayer(playerItem: self.playerItem)
        
        
        // Viewを生成.
        //  let videoPlayerView = AVPlayerView(frame: self.view.bounds)
        videoPlayerView = AVPlayerView(frame: self.view.bounds)
        
        // UIViewのレイヤーをAVPlayerLayerにする.
        let layer = videoPlayerView.layer as! AVPlayerLayer
        
        
        if hairetu.count != 0 {
            
            for (var i = 0; i < cnt ; i++ ) {
                
                var idx = Int(arc4random()) % hairetu.count
                
                //シャッフル先に格納したら削除
                result.append(hairetu[idx])
                hairetu.removeAtIndex(idx)
                println(result)
                
            }
        }
        
        if result[0] == 0 {
            
            // 効果音
            var audioPlayer:AVAudioPlayer = AVAudioPlayer()
            var sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("switch01", ofType: "mp3")!)
            audioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            // ここから以下試しにアニメーションを入れてみた
            UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                
                // buttonを非表示に
                sender.alpha = 0.0
                
                }, completion: {(finished: Bool) -> Void in
                    
                    
                    layer.videoGravity = AVLayerVideoGravityResizeAspectFill
                    layer.player = self.videoPlayer
                    
                    self.view.layer.addSublayer(layer)
                    
                    self.videoPlayer.seekToTime(CMTimeMakeWithSeconds(0, Int32(NSEC_PER_SEC)))
                    self.videoPlayer.play()
                    
                    // 動画の再生が終了した時のNotification.
                    NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayBackDidFinish:",
                        name: AVPlayerItemDidPlayToEndTimeNotification,
                        object: nil)
                    
                    println("\(layer)")
                    println("\(self.videoPlayerView)")
                    
            })
            
        } else {
            
            result.removeAtIndex(0)
            
            
            // 効果音
            var audioPlayer:AVAudioPlayer = AVAudioPlayer()
            var sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("switch01", ofType: "mp3")!)
            audioPlayer = AVAudioPlayer(contentsOfURL: sound_data, error: nil)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            
            switch sender.tag {
                
            case 1:
                //
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView1.hidden = false
                                self.moveView1.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                                
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView1.hidden = true
                                
                        })
                })
                
            case 2:
                //
                
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView2.hidden = false
                                self.moveView2.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView2.hidden = true
                        })
                })
                
            case 3:
                //
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView3.hidden = false
                                self.moveView3.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView3.hidden = true
                        })
                })
                
            case 4:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView4.hidden = false
                                self.moveView4.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView4.hidden = true
                        })
                })
                
            case 5:
                //
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理

                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView5.hidden = false
                                self.moveView5.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView5.hidden = true
                        })
                })
                
            case 6:
                //
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView6.hidden = false
                                self.moveView6.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView6.hidden = true
                        })
                })
                
                
            case 7:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView7.hidden = false
                                self.moveView7.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView7.hidden = true
                        })
                })
                
            case 8:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView8.hidden = false
                                self.moveView8.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView8.hidden = true
                        })
                })
                
            case 9:
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView9.hidden = false
                                self.moveView9.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView9.hidden = true
                        })
                })
                
            case 10:
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView10.hidden = false
                                self.moveView10.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView10.hidden = true
                        })
                })
                
            case 11:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView11.hidden = false
                                self.moveView11.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView11.hidden = true
                        })
                })
                
            case 12:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView12.hidden = false
                                self.moveView12.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView12.hidden = true
                        })
                })
                
            case 13:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView13.hidden = false
                                self.moveView13.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView13.hidden = true
                        })
                })
                
            case 14:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView14.hidden = false
                                self.moveView14.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView14.hidden = true
                        })
                })
                
            case 15:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView15.hidden = false
                                self.moveView15.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView15.hidden = true
                        })
                })
                
            case 16:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView16.hidden = false
                                self.moveView16.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView16.hidden = true
                        })
                })
                
            case 17:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView17.hidden = false
                                self.moveView17.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView17.hidden = true
                        })
                })
                
            case 18:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView18.hidden = false
                                self.moveView18.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView18.hidden = true
                        })
                })
                
            case 19:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView19.hidden = false
                                self.moveView19.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView19.hidden = true
                        })
                })
                
                
            case 20:
                
                // buttonアニメーション
                UIView.animateWithDuration(1.0, delay: 2.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
                    
                    // buttonを非表示に
                    sender.alpha = 0.0
                    
                    }, completion: {(finished: Bool) -> Void in
                        // アニメーション終了後の処理
                        
                        UIView.animateWithDuration(1, // アニメーションの時間
                            animations: {() -> Void  in
                                // アニメーションする処理
                                self.moveView20.hidden = false
                                self.moveView20.frame.origin.x = UIScreen.mainScreen().bounds.width - 10
                            },
                            completion: {(finished: Bool) -> Void in
                                // アニメーション終了後の処理
                                self.moveView20.hidden = true
                        })
                })
                
            default:
                println("それ以外")
            }
        }
        
        println("配列の中身は\(result)です")
        
    }
    
    func moviePlayBackDidFinish(notification: NSNotification) {
        println("再生が終了しますた")
        
        // 通知があったらnotificationを削除.
        NSNotificationCenter.defaultCenter().removeObserver(self, name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        //　再生終了後にボタンを出す
        gameoverButton = UIButton(frame: CGRectMake(0, 0, 200, 200))
        gameoverButton.backgroundColor = UIColor.redColor()
        gameoverButton.alpha = 1
        gameoverButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        gameoverButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ここから独自追加
        // 枠を丸くする.
        gameoverButton.titleLabel?.numberOfLines = 0
        gameoverButton.titleLabel?.font = UIFont.italicSystemFontOfSize(12.0)
        
        // タイトルを設定する(通常時).
        gameoverButton.setTitle("罰ゲーム決定\n\n人生にリセットはない。\nボタンを押して、\nアプリを終了してください。", forState: UIControlState.Normal)
        gameoverButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        
        self.view.addSubview(gameoverButton)
        
        gameoverButton.hidden = false
        videoPlayerView.hidden = false
        
        
        // ここで新たなビューを発生させるコマンドを書く
        /* ◎リセットする必要のあるもの
        ・配列
        ・ボタン
        ・ラベル
        */
        
    }
    
    func onClickMyButton(sender: UIButton) {
        
//        println("ボタンが押されました")
//        gameoverButton.hidden = true
//        videoPlayerView.hidden = true
//        
//        // 罰ゲーム決定。人生にリセットはない。ボタンを押してすぐにアプリを終了してください。
//        // ボタンを押して罰ゲームを開始する
//        
//        
//        // 配列の初期化と並び替え
//        result = [Int]()
//        var hairetu = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
//        if hairetu.count != 0 {
//            var cnt = hairetu.count
//            
//            for (var i = 0; i < cnt ; i++ ) {
//                
//                var idx = Int(arc4random()) % hairetu.count
//                
//                //シャッフル先に格納したら削除
//                result.append(hairetu[idx])
//                hairetu.removeAtIndex(idx)
//                println(result)
//            }
//        }
        
        kill(getpid(),SIGTERM)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall.png")!)
        
        //moveView1
        self.moveView1 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 100, 83))
        let myImage1 = UIImage(named: "1.png")
        moveView1.image = myImage1
        self.view.addSubview(self.moveView1)
        self.moveView1.hidden = true
        
        //moveView2
        self.moveView2 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 110, 128))
        let myImage2 = UIImage(named: "2.png")
        moveView2.image = myImage2
        self.view.addSubview(self.moveView2)
        self.moveView2.hidden = true
        
        //moveView3
        self.moveView3 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 99, 100))
        let myImage3 = UIImage(named: "3.png")
        moveView3.image = myImage3
        self.view.addSubview(self.moveView3)
        self.moveView3.hidden = true
        
        //moveView4
        self.moveView4 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 100, 92))
        let myImage4 = UIImage(named: "4.png")
        moveView4.image = myImage4
        self.view.addSubview(self.moveView4)
        self.moveView4.hidden = true
        
        //moveView5
        self.moveView5 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 78, 100))
        let myImage5 = UIImage(named: "5.png")
        moveView5.image = myImage5
        self.view.addSubview(self.moveView5)
        self.moveView5.hidden = true
        
        //moveView6
        self.moveView6 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 100, 34))
        let myImage6 = UIImage(named: "6.png")
        moveView6.image = myImage6
        self.view.addSubview(self.moveView6)
        self.moveView6.hidden = true
        
        //moveView7
        self.moveView7 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 80, 100))
        let myImage7 = UIImage(named: "7.png")
        moveView7.image = myImage7
        self.view.addSubview(self.moveView7)
        self.moveView7.hidden = true
        
        //moveView8
        self.moveView8 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 100, 96))
        let myImage8 = UIImage(named: "8.png")
        moveView8.image = myImage8
        self.view.addSubview(self.moveView8)
        self.moveView8.hidden = true
        
        //moveView9
        self.moveView9 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 41, 100))
        let myImage9 = UIImage(named: "9.png")
        moveView9.image = myImage9
        self.view.addSubview(self.moveView9)
        self.moveView9.hidden = true
        
        //moveView10
        self.moveView10 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 72, 100))
        let myImage10 = UIImage(named: "10.png")
        moveView10.image = myImage10
        self.view.addSubview(self.moveView10)
        self.moveView10.hidden = true
        
        //moveView11
        self.moveView11 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 50, 100))
        let myImage11 = UIImage(named: "11.png")
        moveView11.image = myImage11
        self.view.addSubview(self.moveView11)
        self.moveView11.hidden = true
        
        //moveView12
        self.moveView12 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 49, 100))
        let myImage12 = UIImage(named: "12.png")
        moveView12.image = myImage12
        self.view.addSubview(self.moveView12)
        self.moveView12.hidden = true
        
        //moveView13
        self.moveView13 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 64, 100))
        let myImage13 = UIImage(named: "13.png")
        moveView13.image = myImage13
        self.view.addSubview(self.moveView13)
        self.moveView13.hidden = true
        
        //moveView14
        self.moveView14 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 66, 100))
        let myImage14 = UIImage(named: "14.png")
        moveView14.image = myImage14
        self.view.addSubview(self.moveView14)
        self.moveView14.hidden = true
        
        //moveView15
        self.moveView15 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 51, 100))
        let myImage15 = UIImage(named: "15.png")
        moveView15.image = myImage15
        self.view.addSubview(self.moveView15)
        self.moveView15.hidden = true
        
        //moveView16
        self.moveView16 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 57, 100))
        let myImage16 = UIImage(named: "16.png")
        moveView16.image = myImage16
        self.view.addSubview(self.moveView16)
        self.moveView16.hidden = true
        
        //moveView17
        self.moveView17 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 26, 100))
        let myImage17 = UIImage(named: "17.png")
        moveView17.image = myImage17
        self.view.addSubview(self.moveView17)
        self.moveView17.hidden = true
        
        //moveView18
        self.moveView18 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 80, 100))
        let myImage18 = UIImage(named: "18.png")
        moveView18.image = myImage18
        self.view.addSubview(self.moveView18)
        self.moveView18.hidden = true
        
        //moveView19
        self.moveView19 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 59, 100))
        let myImage19 = UIImage(named: "19.png")
        moveView19.image = myImage19
        self.view.addSubview(self.moveView19)
        self.moveView19.hidden = true
        
        //moveView20
        self.moveView20 = UIImageView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height / 2, 100, 64))
        let myImage20 = UIImage(named: "20.png")
        moveView20.image = myImage20
        self.view.addSubview(self.moveView20)
        self.moveView20.hidden = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

