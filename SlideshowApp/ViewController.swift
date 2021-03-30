//
//  ViewController.swift
//  SlideshowApp
//
//  Created by CapriCole on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var autoButton: UIButton!
    
    let images:[String] = ["gazou01.jpg","gazou02.jpg","gazou03.jpg","gazou04.jpg","gazou05.jpg","gazou06.jpg"]
    let maxImagenum:Int = 5 //最大画像番号
    let minImagenum:Int = 0 //最小画像番号
    var curNum:Int = 0  //現在画像番号
    var timer:Timer!    //タイマー
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期画像の表示
        dispImage()
    }
    
    //画像表示処理
    func dispImage() {
        let curImage = UIImage(named: images[curNum])
        imageView.image = curImage
    }
    
    //進むボタン押下時処理
    @IBAction func nextImage(_ sender: Any) {
        
        //現在番号が最大値の場合、最小番号を、それ以外は1カウント
        if (curNum == maxImagenum) {
            curNum = minImagenum
        } else {
            curNum += 1
        }
        //画像表示
        dispImage()
    }
    
    //戻るボタン押下時処理
    @IBAction func prevImage(_ sender: Any) {
        
        //現在番号が最小値の場合、最大番号を、それ以外は1マイナス
        if (curNum == minImagenum) {
            curNum = maxImagenum
        } else {
            curNum -= 1
        }
        //画像表示
        dispImage()
    }
    
    //再生／停止ボタン押下時処理
    @IBAction func autoSlide(_ sender: Any) {
        
        //表示されている文字で分岐
        if autoButton.currentTitle == "再生" {
            //表示を「停止」に変更、進む、戻るボタンを無効化
            autoButton.setTitle("停止", for:.normal)
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            
            //タイマー作成起動、スライド開始
            self.timer = Timer.scheduledTimer(timeInterval:2, target:self, selector:#selector(slideImage), userInfo:nil, repeats:true)
            
        } else {
            //表示を「再生」に変更、進む、戻るボタンを有効化
            autoButton.setTitle("再生", for:.normal)
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
            //タイマー停止
            self.timer.invalidate()
        }
    }
    
    //オートスライド処理
    @objc func slideImage() {
        //現在番号が最大値の場合、最小番号を、それ以外は1カウント
        if (curNum == maxImagenum) {
            curNum = minImagenum
        } else {
            curNum += 1
        }
        //画像表示
        dispImage()
    }
    
    //遷移画面へのデータ渡し
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        
        //スライドショー実行中にタップされた場合、スライドショーを停止
        if autoButton.currentTitle == "停止" {
            //表示を「再生」に変更、進む、戻るボタンを有効化
            autoButton.setTitle("再生", for:.normal)
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
            //タイマー停止
            self.timer.invalidate()

        }
        
        //画像名を遷移先に連携
        let expantionVC:ExpantionViewController = segue.destination as! ExpantionViewController
        expantionVC.imageName = images[curNum]
    }
    
    //遷移画面から戻る時の処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

