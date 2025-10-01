import UIKit

protocol RoomViewProtocol: AnyObject {
    func relaod()
}

class RoomViewController: UIViewController {
    
    // MARK: - Variable
    private let presenter: RoomPresenterProtocol
    private let builberUIElements = BuilberUIElements.shared
    
    // MARK: - GUI Variable
//    lazy var navigationView = builberUIElements.createNavigationView(titleLabel: "Steigenberger Makadi")
    lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.addSubview(navigationIconBtn)
        view.addSubview(navigationLabel)
        return view
    }()
    
    lazy var navigationIconBtn: UIButton = {
        let btnIcon = UIButton()
        btnIcon.translatesAutoresizingMaskIntoConstraints = false
        btnIcon.setImage(.chevronLeftIcon, for: .normal)
        btnIcon.widthAnchor.constraint(equalToConstant: 44).isActive = true
        btnIcon.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnIcon.tintColor = .black
        btnIcon.addTarget(self, action: #selector(navigationIconBtnAction), for: .touchUpInside)
        return btnIcon
    }()
    
    lazy var navigationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Steigenberger Makadi"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var roomTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(RoomCell.self, forCellReuseIdentifier: RoomCell.identifier)
        table.separatorStyle = .none
        table.backgroundColor = .appGray
        table.layer.cornerRadius = 15
        return table
    }()
    
    // MARK: - Init
    init(presenter: RoomPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.attechView(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .appGray
        
        addSubviews()
        makeConstraints()
        presenter.viewDidLoad()
    }
    
    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(navigationView)
        view.addSubview(roomTableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 101),
            
            navigationIconBtn.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            navigationIconBtn.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -5),
            
            navigationLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            navigationLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -16),
            
            roomTableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 8),
            roomTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roomTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roomTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Actions
    @objc private func navigationIconBtnAction() {
        presenter.didTapBack()
    }
}

// MARK: - UITableViewDelegate
extension RoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
}

// MARK: - UITableViewDataSource
extension RoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as? RoomCell else { return UITableViewCell() }
        cell.delegete = self
        let model = presenter.item(at: indexPath.row)
        cell.setRoomModel(model: model)
        cell.backgroundColor = .appGray
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - RoomViewProtocol
extension RoomViewController: RoomViewProtocol {
    func relaod() {
        roomTableView.reloadData()
    }
}

// MARK: - RoomCellDelegate
extension RoomViewController: RoomCellDelegate {
    func didTapContinueFromCell(_ cell: RoomCell) {
        presenter.didTapContinue()
    }
}
