//
//  MyPageViewController.swift
//  TVING_Clone
//
//  Created by 박윤빈 on 2023/05/04.
//

import UIKit

class MyPageViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let firstSectionDummy = MyPage.firstSectionDummy()
    private let secondSectionDummy = MyPage.secondSectionDummy()
    private let headerTopView = HeaderTopView()
    private let headerMiddelView = HeaderMiddleView()
    private let headerBottomView = HeaderBottomView()
    private let myPageFooterView = MyPageFooterView()
    
    // MARK: - UI Components

    private let myPageTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        tableView.rowHeight = 54
        tableView.backgroundColor = .black
        return tableView
    }()
    
    private let sectionHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let sectionHeaderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let tableHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerTopView, headerMiddelView, headerBottomView])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        customNavigationBar()
    }
    
    override func configureUI() {
        view.addSubviews(myPageTableView)
    }
    
    override func setLayout() {
        myPageTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func headerLayout() {
        sectionHeaderLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(1)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        
        headerBottomView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
    
    func setTableView() {
        myPageTableView.dataSource = self
        myPageTableView.delegate = self
        tableHeaderView.addSubview(headerStackView)
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.tintColor = .gray1
        navigationController?.navigationBar.barTintColor = .black
        let backButton: UIBarButtonItem = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

extension MyPageViewController: UITableViewDelegate {}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionDummy.count
        } else {
            return secondSectionDummy.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier,
                                                        for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        cell.separatorInset = .zero
            
        if indexPath.section == 0 {
            cell.configureCell(firstSectionDummy[indexPath.row])
        } else {
            cell.configureCell(secondSectionDummy[indexPath.row])
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            return tableHeaderView
        
        case 1:
            sectionHeaderView.addSubview(sectionHeaderLine)
            headerLayout()
            return sectionHeaderView
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 300
        
        case 1:
            return 20
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            return myPageFooterView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 60
    }
}
