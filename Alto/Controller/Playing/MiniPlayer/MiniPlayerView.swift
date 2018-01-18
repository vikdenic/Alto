//
//  MiniPlayerViewController.swift
//  Alto
//
//  Created by Vik Denic on 1/15/18.
//  Copyright © 2018 nekturlabs. All rights reserved.
//

import UIKit
import ChameleonFramework

@IBDesignable

class MiniPlayerView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var song: Song?
    
    var didTapSuperview : ((_ song : Song?) -> ())? = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        self.setSongInfo()
    }
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: MiniPlayerView.className, bundle: bundle).instantiate(withOwner: self, options: nil)
        addSubview(self.view)
        self.view.frame = bounds
    }
    
    func setSongInfo() {
        self.song = Song()
        if let song = self.song {
            songLabel.text = song.title
            artistLabel.text = "\(song.artist) | \(song.album)"
            
            if let artName = self.song?.artName {
                let image = UIImage(named: artName)!
                self.artImageView.image = image
                self.view.backgroundColor = AverageColorFromImage(image)
            }
        }
    }
    
    @IBAction func onSuperviewTapped(_ sender: UITapGestureRecognizer) {
        self.didTapSuperview?(self.song)
    }
    
    @IBAction func onPlayTapped(_ sender: UIButton) {
        print("⏯ tapped")
    }
    
    @IBAction func onForwardTapped(_ sender: UIButton) {
        print("⏩ tapped")
    }
    
}

struct Song {
    var title = "A Day in the Life"
    var artist = "The Beatles"
    var album = "Sgt. Pepper's Lonely Hearts Club Band"
    var artName = "beatlesAlbumArt"
}
