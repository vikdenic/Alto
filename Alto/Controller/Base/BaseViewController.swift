//
//  ViewController.swift
//  Alto
//
//  Created by Vik Denic on 1/15/18.
//  Copyright © 2018 nekturlabs. All rights reserved.
//

import UIKit
import OAuthSwift
import DeckTransition

class BaseViewController: UIViewController {

    @IBOutlet weak var miniPlayerBottomConstraint: NSLayoutConstraint!
    var oauthswift: OAuthSwift!
    @IBOutlet weak var miniPlayerView: MiniPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.miniPlayerBottomConstraint.constant = -UITabBarController().tabBar.frame.size.height
        self.oauth()
        
        self.miniPlayerView.didTapSuperview = { gesture in
            print("👆didTapSuperview")
            self.performSegue(withIdentifier: "\(BaseViewController.className)To\(NowPlayingViewController.className)", sender: self)
        }
    }
    
    func oauth() {
        let oauthswift = OAuth2Swift(
            consumerKey:    "<consumerkey>",
            consumerSecret: "consumersecret",
            authorizeUrl:   "https://www.dropbox.com/1/oauth2/authorize",
            accessTokenUrl: "https://api.dropbox.com/1/oauth2/token",
            responseType:   "token"
        )
        self.oauthswift = oauthswift
        
//        oauthswift.authorizeURLHandler = getURLHandler()
//        let _ = oauthswift.authorize(
//            withCallbackURL: URL(string: "oauth-swift://oauth-callback/dropbox")!, scope: "", state: "",
//            success: { credential, response, parameters in
////                self.showTokenAlert(name: "serviceParameters['name']", credential: credential)
//                // Get Dropbox Account Info
//                let parameters =  Dictionary<String, AnyObject>()
//                let _ = oauthswift.client.get(
//                    "https://api.dropbox.com/1/account/info", parameters: parameters,
//                    success: { response in
//                        let jsonDict = try? response.jsonObject()
//                        print(jsonDict as Any)
//                }, failure: { error in
//                    print(error)
//                }
//                )
//        },
//            failure: { error in
//                print(error.description)
//        }
//        )
    }

}

extension BaseViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "\(BaseViewController.className)To\(NowPlayingViewController.className)" {
            let nowPlayingVC = segue.destination as! NowPlayingViewController
            nowPlayingVC.song = self.miniPlayerView.song
        }
    }
}
