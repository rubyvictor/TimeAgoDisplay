//
//  ViewController.swift
//  TimeAgoDisplay
//
//  Created by Victor Lee on 10/4/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit


class DisplayTimeAgo: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        view.addSubview(timeLabel)
        setupTimeLabelView()
        timeLabel.text = pastDate.timeAgoDisplay()
        
}
    //MARK: setup timeLabel
    
    
    let timeLabel: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        
        return time
    }()

    

    var timeLabelHeightAnchor: NSLayoutConstraint?
    
    func setupTimeLabelView() {
    
        
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.backgroundColor = UIColor.lightGray
        timeLabelHeightAnchor?.isActive = true
        
    }
    
    


}

//Modify the timeIntervalSinceNow in pastDate to show the time ago in seconds:

let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)

extension Date {
    
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < 60 * 60 {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        
        return "\(secondsAgo / day / 7) weeks ago"
    }
    
    
}
