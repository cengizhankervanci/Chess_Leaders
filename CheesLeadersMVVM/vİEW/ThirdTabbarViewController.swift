//
//  ThirdTabbarViewController.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import UIKit

class ThirdTabbarViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    let tableView = UITableView()
    
    private var leaderBattleVM : BattleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        createTableView()
        createNavBarTitle()
        getData()
    }
    
    func createNavBarTitle(){
        let navBarLabel = UILabel()
        navBarLabel.text = "BEST CHEST PLAYERS"
        navBarLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navBarLabel)
    }
    
    func createTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyCellTableViewCell.self, forCellReuseIdentifier: "myCell")
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
    }
    
    func getData(){
        let url = URL(string: "https://api.chess.com/pub/leaderboards")
        WebService().downloadData(url: url!) { leaders in
            if let leaders = leaders{
                self.leaderBattleVM = BattleListViewModel(leadersBattle: leaders)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leaderBattleVM == nil ? 0 : self.leaderBattleVM.leaderBattleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellTableViewCell
        
        let leaderBattleVM = self.leaderBattleVM.leaderBattleBindWithIndex(index: indexPath.row)
        cell.fillAreaWithData(avatar: leaderBattleVM.avatar, userName: leaderBattleVM.username, rank: leaderBattleVM.rank, score: leaderBattleVM.score, win: leaderBattleVM.win_count, draw: leaderBattleVM.draw_count, loss: leaderBattleVM.loss_count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
