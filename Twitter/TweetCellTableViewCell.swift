//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Rajene Harris on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed:\(error)")
            })
        } else {
                TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                    self.setFavorite(isFavorited: false)
                }, failure: { (error) in
                    print("Unfavorite did not succeed: \(error)")
                })
            
        }
    }
    
    var favorited:Bool = false
    var tweetId: Int = -1
    
    func setFavorite( isFavorited:Bool) {
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)        }
    }

    func setRetweeted( isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
