//
//  BlitzViewController.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import UIKit

class BlitzViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    let tableView = UITableView()
    
    private var leaderBlitzVM : BlitzListViewModel!

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
                self.leaderBlitzVM = BlitzListViewModel(leadersBlitz: leaders)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leaderBlitzVM == nil ? 0 : self.leaderBlitzVM.leaderBlitzCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellTableViewCell
        
        let leaderBlitzVM = self.leaderBlitzVM.leaderBlitzBindWithIndex(index: indexPath.row)
        cell.fillAreaWithData(avatar: leaderBlitzVM.avatar, userName: leaderBlitzVM.username, rank: leaderBlitzVM.rank, score: leaderBlitzVM.score, win: leaderBlitzVM.win_count, draw: leaderBlitzVM.draw_count, loss: leaderBlitzVM.loss_count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}
