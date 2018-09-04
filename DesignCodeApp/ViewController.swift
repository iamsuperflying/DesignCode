//
//  ViewController.swift
//
//  Created by LPF. on 2018/9/1.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
        
    }
    
    
    // MARK: Click
    @IBAction func playButtonTapped(_ sender: UIButton) {
        let url = URL(string: urlString)
        let player = AVPlayer(url: url!)
        let avVc = AVPlayerViewController()
        avVc.player = player
        
        present(avVc, animated: true) {
            player.play()
        }
    }
    
}

// MARK: Delegate, DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionsCollectionViewCell
        cell.section = sections[indexPath.row]
        return cell
    }
}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
    }
}

