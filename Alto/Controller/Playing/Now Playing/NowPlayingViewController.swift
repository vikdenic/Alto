//
//  NowPlayingViewController.swift
//  Alto
//
//  Created by Vik Denic on 1/16/18.
//  Copyright © 2018 nekturlabs. All rights reserved.
//

import UIKit
import ChameleonFramework

class NowPlayingViewController: UIViewController {
    
    @IBOutlet weak var artImageView: UIImageView!
    
    var song: Song?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let song = song {
            let image = UIImage(named: song.artName)!
            self.artImageView.image = image
            self.view.backgroundColor = AverageColorFromImage(image)
        }
    }

}
