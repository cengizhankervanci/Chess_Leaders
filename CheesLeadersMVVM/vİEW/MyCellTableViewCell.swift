//
//  MyCellTableViewCell.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 31.05.2023.
//

import UIKit
import Kingfisher

class MyCellTableViewCell: UITableViewCell {
    
    let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 8
        return imageView
    }()
    
    let userName : UILabel = {
        let userLabelView = UILabel()
        userLabelView.font = .systemFont(ofSize: 20, weight: .heavy)
        return userLabelView
    }()
    
    let myRankLabel : UILabel = {
        let myRankLabelView = UILabel()
        myRankLabelView.font = .systemFont(ofSize: 20, weight: .bold)
        return myRankLabelView
    }()
    
    let myScoreLabel : UILabel = {
        let myScoreLabelView = UILabel()
        myScoreLabelView.font = .italicSystemFont(ofSize: 20)
        return myScoreLabelView
    }()
    
    let winLabel : UILabel = {
        let winLabelView = UILabel()
        winLabelView.font = .systemFont(ofSize: 18, weight: .heavy)
        winLabelView.textColor = .green
        winLabelView.text = "Win"
        return winLabelView
    }()
    
    let winCount : UILabel = {
        let winCountView = UILabel()
        winCountView.font = .systemFont(ofSize: 15, weight: .bold)
        return winCountView
    }()
    
    let drawLabel : UILabel = {
        let drawLabelView = UILabel()
        drawLabelView.font = .systemFont(ofSize: 18, weight: .heavy)
        drawLabelView.textColor = .orange
        drawLabelView.text = "Draw"
        return drawLabelView
    }()
    
    let drawCount : UILabel = {
        let drawCountView = UILabel()
        drawCountView.font = .systemFont(ofSize: 15, weight: .bold)
        return drawCountView
    }()
    
    let lossLabel : UILabel = {
        let lossLabelView = UILabel()
        lossLabelView.font = .systemFont(ofSize: 18, weight: .heavy)
        lossLabelView.textColor = .red
        lossLabelView.text = "Lose"
        return lossLabelView
    }()
    
    let loseCount : UILabel = {
        let loseCountView = UILabel()
        loseCountView.font = .systemFont(ofSize: 15, weight: .bold)
        return loseCountView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(userName)
        contentView.addSubview(myRankLabel)
        contentView.addSubview(myScoreLabel)
        contentView.addSubview(winLabel)
        contentView.addSubview(winCount)
        contentView.addSubview(drawLabel)
        contentView.addSubview(drawCount)
        contentView.addSubview(lossLabel)
        contentView.addSubview(loseCount)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillAreaWithData(avatar: String, userName: String, rank: Int, score: Int, win: Int, draw: Int, loss: Int){
        let radius = RoundCornerImageProcessor(cornerRadius: 20)
        self.myImageView.kf.setImage(with: URL(string: avatar),options: [.processor(radius)])
        self.userName.text = userName
        self.myRankLabel.text = "#" + String(rank)
        self.myScoreLabel.text = "Score:" + String(score)
        self.winCount.text = String(win)
        self.drawCount.text = String(draw)
        self.loseCount.text = String(loss)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        userName.text = nil
        myRankLabel.text = nil
        myScoreLabel.text = nil
        winCount.text = nil
        drawCount.text = nil
        loseCount.text = nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 50,
                                   y: 25,
                                   width: 5,
                                   height: contentView.frame.size.height - 50)
        
        userName.frame = CGRect(x: 110 + myImageView.frame.size.width,
                               y: -50,
                               width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                               height: contentView.frame.size.height)
        
        myRankLabel.frame = CGRect(x: 100 + userName.frame.size.width,
                                   y: -50,
                                   width: 50,
                                   height: contentView.frame.size.height)
        
        myScoreLabel.frame = CGRect(x: 110 + myImageView.frame.size.width,
                                    y: -30,
                                    width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                    height: contentView.frame.size.height)
        
        winLabel.frame = CGRect(x: 130 + myImageView.frame.size.width,
                                y: 0,
                                width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                height: contentView.frame.size.height)
        
        winCount.frame = CGRect(x: 130 + myImageView.frame.size.width,
                                y: 20,
                                width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                height: contentView.frame.size.height)
        
        drawLabel.frame = CGRect(x: 210 + myImageView.frame.size.width,
                                 y: 0,
                                 width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                 height: contentView.frame.size.height)
        
        drawCount.frame = CGRect(x: 210 + myImageView.frame.size.width,
                                 y: 20,
                                 width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                 height: contentView.frame.size.height)
        
        lossLabel.frame = CGRect(x: 300 + myImageView.frame.size.width,
                                 y: 0,
                                 width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                 height: contentView.frame.size.height)
        
        loseCount.frame = CGRect(x: 300 + myImageView.frame.size.width,
                                 y: 20,
                                 width: contentView.frame.size.width - 10 - myImageView.frame.size.width - contentView.frame.size.height - 6,
                                 height: contentView.frame.size.height)
    }
    
}
