//
//  ViewController.swift
//  ShareApp
//
//  Created by Mikhail Serov on 23.11.2019.
//  Copyright © 2019 serov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        
        let v = UIView(frame: UIScreen.main.bounds)
        v.backgroundColor = .white
        view.addSubview(v)
    }

    private func buildUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leading(0).trailing(0).bottom(0).top(0)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        return cell
    }

}
