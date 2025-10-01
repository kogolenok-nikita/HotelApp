import UIKit

protocol SuccessViewProtocol: AnyObject {
    
}

class SuccessViewController: UIViewController {
    
    // MARK: - Variable
    private let presenter: SuccessPresenterProtocol
    private let builberUIElements = BuilberUIElements.shared
    
    // MARK: - GUI Variable
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
        label.text = "Заказт оплачен"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray3
        view.widthAnchor.constraint(equalToConstant: 94).isActive = true
        view.heightAnchor.constraint(equalToConstant: 94).isActive = true
        view.layer.cornerRadius = 47
        
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 44).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 44).isActive = true
        icon.image = .successIcon
        
        view.addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        return view
    }()
    
    lazy var successTitle  = builberUIElements.createTitleLabel(title: "Ваш заказ принят в работу")
    lazy var successDetail = builberUIElements.createGray2Label(title: "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
    lazy var bottomView    = builberUIElements.createBottomViewWithButton(buttomTitle: "Супер!", target: self, action: #selector(bottomBtnAction))
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .appWhite
        
        addSubviews()
        makeConstraints()
        presenter.viewDidLoad()
    }
    
    // MARK: - Init
    init(presenter: SuccessPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(navigationView)
        view.addSubview(circleView)
        view.addSubview(successTitle)
        view.addSubview(successDetail)
        successTitle.textAlignment  = .center
        successDetail.textAlignment = .center
        view.addSubview(bottomView)
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
            
            circleView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 122),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            successTitle.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 32),
            successTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            successTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            successDetail.topAnchor.constraint(equalTo: successTitle.bottomAnchor, constant: 20),
            successDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            successDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 88),
        ])
    }
    
    // MARK: - Actions
    @objc private func navigationIconBtnAction() {
        presenter.didTapBack()
    }
    
    @objc private func bottomBtnAction() {
        print("👍")
    }
}

// MARK: -
extension SuccessViewController: SuccessViewProtocol {
    
}


