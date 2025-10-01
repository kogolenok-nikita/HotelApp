import UIKit

protocol BookingViewProtocol: AnyObject {
    
}

class BookingViewController: UIViewController {
    
    // MARK: - Variable
    private let presenter: BookingPresenterProtocol
    private let builberUIElements = BuilberUIElements.shared
    private var isChevronUpDonw = true
    private var expandedBottomConstraint: NSLayoutConstraint!
    private var collapsedBottomConstraint: NSLayoutConstraint!
    
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
        label.text = "Бронирование"
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
        view.addSubview(roomView)
        view.addSubview(infoView)
        view.addSubview(buyerInfoView)
        view.addSubview(firstTourView)
        view.addSubview(secondTourView)
        view.addSubview(addTourView)
        view.addSubview(priceView)
        return view
    }()
    
    lazy var roomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(starStackView)
        view.addSubview(roomTitle)
        view.addSubview(roomBtn)
        return view
    }()
    
    lazy var starStackView = builberUIElements.createStarStackView(text: "5 Превосходно")
    lazy var roomTitle     = builberUIElements.createTitleLabel(title: "Steigenberger Makadi")
    lazy var roomBtn       = builberUIElements.createBlueBtn(title: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(infoLblG1)
        view.addSubview(infoLblB1)
        view.addSubview(infoLblG2)
        view.addSubview(infoLblB2)
        view.addSubview(infoLblG3)
        view.addSubview(infoLblB3)
        view.addSubview(infoLblG4)
        view.addSubview(infoLblB4)
        view.addSubview(infoLblG5)
        view.addSubview(infoLblB5)
        view.addSubview(infoLblG6)
        view.addSubview(infoLblB6)
        view.addSubview(infoLblG7)
        view.addSubview(infoLblB7)
        return view
    }()
    
    lazy var infoLblG1 = builberUIElements.createGray2Label(title: "Вылет из")
    lazy var infoLblG2 = builberUIElements.createGray2Label(title: "Страна,город")
    lazy var infoLblG3 = builberUIElements.createGray2Label(title: "Даты")
    lazy var infoLblG4 = builberUIElements.createGray2Label(title: "Кол-во ночей")
    lazy var infoLblG5 = builberUIElements.createGray2Label(title: "Отель")
    lazy var infoLblG6 = builberUIElements.createGray2Label(title: "Номер")
    lazy var infoLblG7 = builberUIElements.createGray2Label(title: "Питание")
    
    lazy var infoLblB1 = builberUIElements.createBlackLabel(title: "Минск")
    lazy var infoLblB2 = builberUIElements.createBlackLabel(title: "Египет,Хургада")
    lazy var infoLblB3 = builberUIElements.createBlackLabel(title: "19.09.2025-27.09.2025")
    lazy var infoLblB4 = builberUIElements.createBlackLabel(title: "7 ночей")
    lazy var infoLblB5 = builberUIElements.createBlackLabel(title: "Steigenberger Makadi")
    lazy var infoLblB6 = builberUIElements.createBlackLabel(title: "Стандартный с видом на бассейн или сад")
    lazy var infoLblB7 = builberUIElements.createBlackLabel(title: "Все включено")
    
    lazy var buyerInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(buyerTitle)
        view.addSubview(buyerNumber)
        view.addSubview(buyerEmail)
        view.addSubview(buyerDetail)
        return view
    }()
    
    lazy var buyerTitle  = builberUIElements.createTitleLabel(title: "Информация о покупателе")
    lazy var buyerNumber = builberUIElements.createLabelTextFieldStack(title: "Номер телефона", placeholder: "+375(29)XXX-XX-XX")
    lazy var buyerEmail  = builberUIElements.createLabelTextFieldStack(title: "Почта", placeholder: "examplemail.gmail.com")
    lazy var buyerDetail = builberUIElements.createGray2Label(title: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
    
    lazy var firstTourView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(firstTitleLbl)
        view.addSubview(firstVBtn)
        view.addSubview(infoNameView)
        view.addSubview(infoSurnameView)
        view.addSubview(infoBirthView)
        view.addSubview(infoCitizenshipView)
        view.addSubview(infoPassportView)
        view.addSubview(infoValPassportView)
        return view
    }()
    
    lazy var firstTitleLbl = builberUIElements.createTitleLabel(title: "Первый турист")
    
    lazy var firstVBtn: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.backgroundColor = .appBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 6
        view.addSubview(firstBtn)
        return view
    }()
    
    lazy var firstBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.chevronUpIcon, for: .normal)
        button.tintColor = .appBlue
        button.addTarget(self, action: #selector(firstViewBtnTap), for: .touchUpInside)
        return button
    }()
    
    lazy var infoNameView = builberUIElements.createLabelTextFieldStack(title: "Имя", placeholder: "Nikita")
    lazy var infoSurnameView = builberUIElements.createLabelTextFieldStack(title: "Фамилия", placeholder: "Kogolenok")
    lazy var infoBirthView = builberUIElements.createLabelTextFieldStack(title: "Дата рождения", placeholder: "22.09.1997")
    lazy var infoCitizenshipView = builberUIElements.createLabelTextFieldStack(title: "Гражданство", placeholder: "Belarus")
    lazy var infoPassportView = builberUIElements.createLabelTextFieldStack(title: "Номер паспорта", placeholder: "PD0303376")
    lazy var infoValPassportView = builberUIElements.createLabelTextFieldStack(title: "Срок действия паспорта", placeholder: "20.06.2035")
    
    lazy var secondTourView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(secondTitleLbl)
        view.addSubview(secondVBtn)
        return view
    }()
    
    lazy var secondTitleLbl = builberUIElements.createTitleLabel(title: "Второй турист")
    
    lazy var secondVBtn: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.backgroundColor = .appBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 6
        view.addSubview(secondBtn)
        return view
    }()
    
    lazy var secondBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.chevronDownIcon, for: .normal)
        button.tintColor = .appBlue
        button.addTarget(self, action: #selector(secondViewBtnTap), for: .touchUpInside)
        return button
    }()
    
    lazy var addTourView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(addTitleLbl)
        view.addSubview(addVBtn)
        return view
    }()
    
    lazy var addTitleLbl = builberUIElements.createTitleLabel(title: "Добавить туриста")
    
    lazy var addVBtn: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.backgroundColor = .appBlue
        view.layer.cornerRadius = 6
        view.addSubview(addBtn)
        return view
    }()
    
    lazy var addBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.plusIcon, for: .normal)
        button.tintColor = .appBlue
        button.addTarget(self, action: #selector(addViewBtnTap), for: .touchUpInside)
        return button
    }()
    
    
    lazy var priceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.layer.cornerRadius = 15
        view.addSubview(tourLabel)
        view.addSubview(tax1Label)
        view.addSubview(tax2Label)
        view.addSubview(priceLabel)
        view.addSubview(price1)
        view.addSubview(price2)
        view.addSubview(price3)
        view.addSubview(price4)
        return view
    }()
    
    lazy var tourLabel = builberUIElements.createGray2Label(title: "Тур")
    lazy var tax1Label = builberUIElements.createGray2Label(title: "Топливный сбор")
    lazy var tax2Label = builberUIElements.createGray2Label(title: "Сервисный сбор")
    lazy var priceLabel = builberUIElements.createGray2Label(title: "К оплате")
    
    lazy var price1 = builberUIElements.createBlackLabel(title: "186 600 ₽")
    lazy var price2 = builberUIElements.createBlackLabel(title: "9 300 ₽")
    lazy var price3 = builberUIElements.createBlackLabel(title: "2 136 ₽")
    lazy var price4 = builberUIElements.createBlackLabel(title: "198 036 ₽")
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        view.addSubview(bottomBtn)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appGray.cgColor
        return view
    }()
    
    lazy var bottomBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Оплатить", for: .normal)
        btn.setTitleColor(.appWhite, for: .normal)
        btn.backgroundColor = .appBlue
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(bottomBtnAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Init
    init(presenter: BookingPresenterProtocol) {
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
        view.addSubview(scrollView)
        view.addSubview(bottomView)
    }
    
    private func makeConstraints() {
        expandedBottomConstraint = firstTourView.bottomAnchor.constraint(equalTo: infoValPassportView.bottomAnchor, constant: 16)
        collapsedBottomConstraint = firstTourView.bottomAnchor.constraint(equalTo: firstVBtn.bottomAnchor, constant: 13)
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 101),
            
            navigationIconBtn.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor),
            navigationIconBtn.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -5),
            
            navigationLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            navigationLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -10),
            
            viewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            roomView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            roomView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            roomView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            
            starStackView.topAnchor.constraint(equalTo: roomView.topAnchor, constant: 16),
            starStackView.leadingAnchor.constraint(equalTo: roomView.leadingAnchor, constant: 16),
            starStackView.heightAnchor.constraint(equalToConstant: 29),
            
            roomTitle.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 8),
            roomTitle.leadingAnchor.constraint(equalTo: roomView.leadingAnchor, constant: 16),
            roomTitle.trailingAnchor.constraint(equalTo: roomView.trailingAnchor, constant: -16),
            roomTitle.heightAnchor.constraint(equalToConstant: 26),
            
            roomBtn.topAnchor.constraint(equalTo: roomTitle.bottomAnchor, constant: 8),
            roomBtn.leadingAnchor.constraint(equalTo: roomView.leadingAnchor, constant: 16),
            roomBtn.bottomAnchor.constraint(equalTo: roomView.bottomAnchor, constant: -16),
            roomBtn.heightAnchor.constraint(equalToConstant: 17),
            
            infoView.topAnchor.constraint(equalTo: roomView.bottomAnchor, constant: 8),
            infoView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            //infoView.heightAnchor.constraint(equalToConstant: 280),
            
            infoLblG1.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16),
            infoLblG1.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB1.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 16),
            infoLblB1.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG2.topAnchor.constraint(equalTo: infoLblG1.bottomAnchor, constant: 16),
            infoLblG2.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB2.topAnchor.constraint(equalTo: infoLblB1.bottomAnchor, constant: 16),
            infoLblB2.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG3.topAnchor.constraint(equalTo: infoLblG2.bottomAnchor, constant: 16),
            infoLblG3.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB3.topAnchor.constraint(equalTo: infoLblB2.bottomAnchor, constant: 16),
            infoLblB3.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG4.topAnchor.constraint(equalTo: infoLblG3.bottomAnchor, constant: 16),
            infoLblG4.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB4.topAnchor.constraint(equalTo: infoLblB3.bottomAnchor, constant: 16),
            infoLblB4.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG5.topAnchor.constraint(equalTo: infoLblG4.bottomAnchor, constant: 16),
            infoLblG5.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB5.topAnchor.constraint(equalTo: infoLblB4.bottomAnchor, constant: 16),
            infoLblB5.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG6.topAnchor.constraint(equalTo: infoLblG5.bottomAnchor, constant: 16),
            infoLblG6.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB6.topAnchor.constraint(equalTo: infoLblB5.bottomAnchor, constant: 16),
            infoLblB6.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            
            infoLblG7.topAnchor.constraint(equalTo: infoLblG6.bottomAnchor, constant: 16),
            infoLblG7.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 16),
            
            infoLblB7.topAnchor.constraint(equalTo: infoLblB6.bottomAnchor, constant: 16),
            infoLblB7.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -16),
            infoLblB7.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -16),
            
            buyerInfoView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 8),
            buyerInfoView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            buyerInfoView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            //buyerInfoView.heightAnchor.constraint(equalToConstant: 232),
            
            buyerTitle.topAnchor.constraint(equalTo: buyerInfoView.topAnchor, constant: 16),
            buyerTitle.leadingAnchor.constraint(equalTo: buyerInfoView.leadingAnchor, constant: 16),
            buyerTitle.trailingAnchor.constraint(equalTo: buyerInfoView.trailingAnchor, constant: -16),
            buyerTitle.heightAnchor.constraint(equalToConstant: 26),
            
            buyerNumber.topAnchor.constraint(equalTo: buyerTitle.bottomAnchor, constant: 20),
            buyerNumber.leadingAnchor.constraint(equalTo: buyerInfoView.leadingAnchor, constant: 16),
            buyerNumber.trailingAnchor.constraint(equalTo: buyerInfoView.trailingAnchor, constant: -16),
            buyerNumber.heightAnchor.constraint(equalToConstant: 52),
            
            buyerEmail.topAnchor.constraint(equalTo: buyerNumber.bottomAnchor, constant: 8),
            buyerEmail.leadingAnchor.constraint(equalTo: buyerInfoView.leadingAnchor, constant: 16),
            buyerEmail.trailingAnchor.constraint(equalTo: buyerInfoView.trailingAnchor, constant: -16),
            buyerEmail.heightAnchor.constraint(equalToConstant: 52),
            
            buyerDetail.topAnchor.constraint(equalTo: buyerEmail.bottomAnchor, constant: 8),
            buyerDetail.leadingAnchor.constraint(equalTo: buyerInfoView.leadingAnchor, constant: 16),
            buyerDetail.trailingAnchor.constraint(equalTo: buyerInfoView.trailingAnchor, constant: -16),
            buyerDetail.bottomAnchor.constraint(equalTo: buyerInfoView.bottomAnchor, constant: -16),
            buyerDetail.heightAnchor.constraint(equalToConstant: 34),
            
            firstTourView.topAnchor.constraint(equalTo: buyerInfoView.bottomAnchor, constant: 8),
            firstTourView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            firstTourView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
//            firstTourView.heightAnchor.constraint(equalToConstant: 58),
            
            firstTitleLbl.topAnchor.constraint(equalTo: firstTourView.topAnchor, constant: 16),
            firstTitleLbl.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            firstTitleLbl.trailingAnchor.constraint(equalTo: firstVBtn.leadingAnchor, constant: -5),
            firstTitleLbl.heightAnchor.constraint(equalToConstant: 26),
            
            firstVBtn.topAnchor.constraint(equalTo: firstTourView.topAnchor, constant: 13),
            firstVBtn.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            
            firstBtn.centerXAnchor.constraint(equalTo: firstVBtn.centerXAnchor),
            firstBtn.centerYAnchor.constraint(equalTo: firstVBtn.centerYAnchor),
            
            infoNameView.topAnchor.constraint(equalTo: firstTitleLbl.bottomAnchor, constant: 20),
            infoNameView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoNameView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            //infoView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -16),
            infoNameView.heightAnchor.constraint(equalToConstant: 52),
            
            infoSurnameView.topAnchor.constraint(equalTo: infoNameView.bottomAnchor, constant: 8),
            infoSurnameView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoSurnameView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            infoSurnameView.heightAnchor.constraint(equalToConstant: 52),
            
            infoBirthView.topAnchor.constraint(equalTo: infoSurnameView.bottomAnchor, constant: 8),
            infoBirthView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoBirthView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            infoBirthView.heightAnchor.constraint(equalToConstant: 52),
            
            infoCitizenshipView.topAnchor.constraint(equalTo: infoBirthView.bottomAnchor, constant: 8),
            infoCitizenshipView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoCitizenshipView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            infoCitizenshipView.heightAnchor.constraint(equalToConstant: 52),
            
            infoPassportView.topAnchor.constraint(equalTo: infoCitizenshipView.bottomAnchor, constant: 8),
            infoPassportView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoPassportView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            infoPassportView.heightAnchor.constraint(equalToConstant: 52),
            
            infoValPassportView.topAnchor.constraint(equalTo: infoPassportView.bottomAnchor, constant: 8),
            infoValPassportView.leadingAnchor.constraint(equalTo: firstTourView.leadingAnchor, constant: 16),
            infoValPassportView.trailingAnchor.constraint(equalTo: firstTourView.trailingAnchor, constant: -16),
            infoValPassportView.heightAnchor.constraint(equalToConstant: 52),
            
            secondTourView.topAnchor.constraint(equalTo: firstTourView.bottomAnchor, constant: 8),
            secondTourView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            secondTourView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            secondTourView.heightAnchor.constraint(equalToConstant: 58),
            
            secondTitleLbl.topAnchor.constraint(equalTo: secondTourView.topAnchor, constant: 16),
            secondTitleLbl.leadingAnchor.constraint(equalTo: secondTourView.leadingAnchor, constant: 16),
            secondTitleLbl.trailingAnchor.constraint(equalTo: secondVBtn.leadingAnchor, constant: -5),
            secondTitleLbl.heightAnchor.constraint(equalToConstant: 26),
            
            secondVBtn.topAnchor.constraint(equalTo: secondTourView.topAnchor, constant: 13),
            secondVBtn.trailingAnchor.constraint(equalTo: secondTourView.trailingAnchor, constant: -16),
            
            secondBtn.centerXAnchor.constraint(equalTo: secondVBtn.centerXAnchor),
            secondBtn.centerYAnchor.constraint(equalTo: secondVBtn.centerYAnchor),
            
            addTourView.topAnchor.constraint(equalTo: secondTourView.bottomAnchor, constant: 8),
            addTourView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            addTourView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            addTourView.heightAnchor.constraint(equalToConstant: 58),
            
            addTitleLbl.topAnchor.constraint(equalTo: addTourView.topAnchor, constant: 16),
            addTitleLbl.leadingAnchor.constraint(equalTo: addTourView.leadingAnchor, constant: 16),
            addTitleLbl.trailingAnchor.constraint(equalTo: addVBtn.leadingAnchor, constant: -5),
            addTitleLbl.heightAnchor.constraint(equalToConstant: 26),
            
            addVBtn.topAnchor.constraint(equalTo: addTourView.topAnchor, constant: 13),
            addVBtn.trailingAnchor.constraint(equalTo: addTourView.trailingAnchor, constant: -16),
            
            addBtn.centerXAnchor.constraint(equalTo: addVBtn.centerXAnchor),
            addBtn.centerYAnchor.constraint(equalTo: addVBtn.centerYAnchor),
            
            priceView.topAnchor.constraint(equalTo: addTourView.bottomAnchor, constant: 8),
            priceView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            priceView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
            //priceView.heightAnchor.constraint(equalToConstant: 156),
            
            tourLabel.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 16),
            tourLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 16),
            
            tax1Label.topAnchor.constraint(equalTo: tourLabel.bottomAnchor, constant: 16),
            tax1Label.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 16),
            
            tax2Label.topAnchor.constraint(equalTo: tax1Label.bottomAnchor, constant: 16),
            tax2Label.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 16),
            
            priceLabel.topAnchor.constraint(equalTo: tax2Label.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor, constant: 16),
            priceLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: -16),
            
            price1.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 16),
            price1.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -16),
            
            price2.topAnchor.constraint(equalTo: price1.bottomAnchor, constant: 16),
            price2.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -16),
            
            price3.topAnchor.constraint(equalTo: price2.bottomAnchor, constant: 16),
            price3.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -16),
            
            price4.topAnchor.constraint(equalTo: price3.bottomAnchor, constant: 16),
            price4.trailingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: -16),
            
            //bottomView
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 88),
            
            bottomBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            bottomBtn.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            bottomBtn.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            bottomBtn.heightAnchor.constraint(equalToConstant: 48),
            
            expandedBottomConstraint
        ])
        collapsedBottomConstraint.isActive = false
    }
    
    // MARK: - Actions
    @objc private func navigationIconBtnAction() {
        presenter.didTapBack()
    }
    
    @objc private func bottomBtnAction() {
        presenter.didTapContinue()
    }
    
    @objc private func firstViewBtnTap() {
        if isChevronUpDonw {
            firstBtn.setImage(.chevronDownIcon, for: .normal)
            expandedBottomConstraint.isActive = false
            collapsedBottomConstraint.isActive = true
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.infoNameView.isHidden = true
                self.infoSurnameView.isHidden = true
                self.infoBirthView.isHidden = true
                self.infoCitizenshipView.isHidden = true
                self.infoPassportView.isHidden = true
                self.infoValPassportView.isHidden = true
            }
        } else {
            firstBtn.setImage(.chevronUpIcon, for: .normal)
            collapsedBottomConstraint.isActive = false
            expandedBottomConstraint.isActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.infoNameView.isHidden = false
                self.infoSurnameView.isHidden = false
                self.infoBirthView.isHidden = false
                self.infoCitizenshipView.isHidden = false
                self.infoPassportView.isHidden = false
                self.infoValPassportView.isHidden = false
            }
        }
        isChevronUpDonw.toggle()
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func secondViewBtnTap() {
        
    }
    
    @objc private func addViewBtnTap() {
        
    }
}

// MARK: - BookingViewProtocol
extension BookingViewController: BookingViewProtocol {
    
}
