//
//  ViewController.swift
//  TechPod
//
//  Created by 若宮拓也 on 2022/08/27.
//

import UIKit
import AVFoundation


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはこのクラスが持っているという設定
        table.dataSource = self
        
        //宣言
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    //セル数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count //配列の回数
    }
    
    //ID付きのセルを取得→セル付属のtextLabelに表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named:  imageNameArray[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOf:  audioPath)
        
        audioPlayer.play()
    }


}

