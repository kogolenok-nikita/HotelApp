import UIKit

protocol HotelViewProtocol: AnyObject {
    func reload()
}

class HotelViewController: UIViewController {
    
    // MARK: - Variable
    private let presenter: HotelPresenterProtocol
    private let builberUIElements = BuilberUIElements.shared
    
    // MARK: - GUI Variable
    lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.addSubview(navigationLabel)
        return view
    }()
    
    lazy var navigationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Отель"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .appGray
        scroll.addSubview(viewContainer)
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray
        view.addSubview(headerView)
        view.addSubview(bodyView)
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.addSubview(headerImageView)
        view.addSubview(starStackView)
        view.addSubview(headerTitle)
        view.addSubview(headerBtn)
        view.addSubview(headerPriceLabel)
        view.addSubview(headerInfoLabel)
        return view
    }()
    
    lazy var headerImageView = builberUIElements.createImageView(imageName: "hotel1")
    lazy var starStackView   = builberUIElements.createStarStackView(text: "5 Превосходно")    
    lazy var headerTitle = builberUIElements.createTitleLabel(title: "Steigenberger Makadi")
    lazy var headerBtn = builberUIElements.createBlueBtn(title: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
    lazy var headerPriceLabel = builberUIElements.createPriceLabel(title: "от 134 673 ₽")
    lazy var headerInfoLabel = builberUIElements.createGray2Label(title: "за тур с перелётом")
    
    lazy var bodyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 12
        view.addSubview(bodyTitle)
        view.addSubview(bodyViewInfo1)
        view.addSubview(bodyViewInfo2)
        view.addSubview(bodyViewInfo3)
        view.addSubview(bodyViewInfo4)
        view.addSubview(bodyDetail)
        view.addSubview(bodyViewTable)
        return view
    }()
    
    lazy var bodyTitle     = builberUIElements.createTitleLabel(title: "Об отеле")
    lazy var bodyViewInfo1 = builberUIElements.createBodyView(withText: "3-ая линия")
    lazy var bodyViewInfo2 = builberUIElements.createBodyView(withText: "Платный Wi-Fi в фойе")
    lazy var bodyViewInfo3 = builberUIElements.createBodyView(withText: "30 км до аэропорта")
    lazy var bodyViewInfo4 = builberUIElements.createBodyView(withText: "1 км до пляжа")
    lazy var bodyDetail    = builberUIElements.createBlackLabel(title: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
    
    lazy var bodyViewTable: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray
        view.layer.cornerRadius = 15
        view.addSubview(bodyTableView)
        return view
    }()
    
    lazy var bodyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BodyCell.self, forCellReuseIdentifier: BodyCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .appGray
        tableView.layer.cornerRadius = 15
        return tableView
    }()
    
    lazy var bottomView = builberUIElements.createBottomViewWithButton(buttomTitle: "К выбору номера", target: self, action: #selector(bottomBtnAction))
    
    // MARK: - Init
    init(presenter: HotelPresenterProtocol) {
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
        presenter.viedDidLoad()
    }
    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(navigationView)
        view.addSubview(scrollView)
        view.addSubview(bottomView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 101),
            
            navigationLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            navigationLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -12),
            
            viewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            //headerView.heightAnchor.constraint(equalToConstant: 429),
            
            headerImageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerImageView.heightAnchor.constraint(equalToConstant: 257),
            
            starStackView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 16),
            starStackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            //starStackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            starStackView.heightAnchor.constraint(equalToConstant: 29),
            
            headerTitle.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 8),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerTitle.heightAnchor.constraint(equalToConstant: 26),
            
            headerBtn.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 8),
            headerBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerBtn.heightAnchor.constraint(equalToConstant: 17),
            
            headerPriceLabel.topAnchor.constraint(equalTo: headerBtn.bottomAnchor, constant: 16),
            headerPriceLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerPriceLabel.heightAnchor.constraint(equalToConstant: 36),
            headerPriceLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            headerInfoLabel.topAnchor.constraint(equalTo: headerBtn.bottomAnchor, constant: 30),
            headerInfoLabel.leadingAnchor.constraint(equalTo: headerPriceLabel.trailingAnchor, constant: 8),
            headerInfoLabel.heightAnchor.constraint(equalToConstant: 19),
            
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            bodyView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            bodyView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -10),
            
            bodyTitle.topAnchor.constraint(equalTo: bodyView.topAnchor, constant: 16),
            bodyTitle.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 16),
            bodyTitle.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -16),
//            bodyTitle.heightAnchor.constraint(equalToConstant: 26),
            //bodyTitle.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: -10),
            
            bodyViewInfo1.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 16),
            bodyViewInfo1.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 16),
            bodyViewInfo1.heightAnchor.constraint(equalToConstant: 29),
            
            bodyViewInfo2.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 16),
            bodyViewInfo2.leadingAnchor.constraint(equalTo: bodyViewInfo1.trailingAnchor, constant: 8),
            bodyViewInfo2.heightAnchor.constraint(equalToConstant: 29),
            
            bodyViewInfo3.topAnchor.constraint(equalTo: bodyViewInfo1.bottomAnchor, constant: 8),
            bodyViewInfo3.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 16),
            bodyViewInfo3.heightAnchor.constraint(equalToConstant: 29),
            
            bodyViewInfo4.topAnchor.constraint(equalTo: bodyViewInfo2.bottomAnchor, constant: 8),
            bodyViewInfo4.leadingAnchor.constraint(equalTo: bodyViewInfo3.trailingAnchor, constant: 8),
            bodyViewInfo4.heightAnchor.constraint(equalToConstant: 29),
            
            bodyDetail.topAnchor.constraint(equalTo: bodyViewInfo3.bottomAnchor, constant: 12),
            bodyDetail.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 16),
            bodyDetail.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -16),
            //bodyDetail.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: -16),
            
            bodyViewTable.topAnchor.constraint(equalTo: bodyDetail.bottomAnchor, constant: 16),
            bodyViewTable.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 16),
            bodyViewTable.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -16),
            bodyViewTable.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: -16),
            bodyViewTable.heightAnchor.constraint(equalToConstant: 184),
            
            bodyTableView.topAnchor.constraint(equalTo: bodyViewTable.topAnchor),
            bodyTableView.leadingAnchor.constraint(equalTo: bodyViewTable.leadingAnchor),
            bodyTableView.trailingAnchor.constraint(equalTo: bodyViewTable.trailingAnchor),
            bodyTableView.bottomAnchor.constraint(equalTo: bodyViewTable.bottomAnchor),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 88),
        ])
    }
    
    // MARK: - Actions
    @objc private func bottomBtnAction() {
        presenter.didTapContinue()
    }
}

// MARK: - UITableViewDelegate
extension HotelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource
extension HotelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BodyCell.identifier, for: indexPath) as? BodyCell else { return UITableViewCell() }
        
        let model = presenter.item(at: indexPath.row)
        cell.setBodyModel(model: model)
        cell.backgroundColor = .appGray
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - HotelViewProtocol
extension HotelViewController: HotelViewProtocol {
    func reload() {
        bodyTableView.reloadData()
    }
}
