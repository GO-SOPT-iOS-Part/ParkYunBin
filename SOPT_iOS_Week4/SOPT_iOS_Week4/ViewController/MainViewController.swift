//
//  ViewController.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/06.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var responseData: [Results] = []
    
    // MARK: - UI Components
    
    private let dailyMovieTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 200
        return tableView
    }()
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setTableView()
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getDailyMovie()
    }
    func register() {
        dailyMovieTableView.register(DailyMovieTableViewCell.self, forCellReuseIdentifier: DailyMovieTableViewCell.cellIdentifier)
    }
    func configureUI() {
        view.addSubview(dailyMovieTableView)
    }
    
    func setLayout() {
        dailyMovieTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setTableView() {
        dailyMovieTableView.delegate = self
        dailyMovieTableView.dataSource = self
    }
    
    private func getDailyMovie() {
        DailyMovieService.shared.dailyMovie() { response in
            switch response {
            case .success(let data):
                guard let data = data as? DailyMovieResponse else { return }
                self.responseData = data.results
                self.dailyMovieTableView.reloadData()
            default:
                print("beep")
            }
        }
    }
}

extension MainViewController: UITableViewDelegate {}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyMovieTableViewCell.cellIdentifier,
                                                       for: indexPath) as? DailyMovieTableViewCell else { return UITableViewCell() }
        cell.configureCell(responseData[indexPath.row])
        
        return cell
    }
    
    
}
