import UIKit

class TestVC: UIViewController {
    
    private var isChevronUpDonw = true
    private var expandedBottomConstraint: NSLayoutConstraint!
    private var collapsedBottomConstraint: NSLayoutConstraint!
    
    private let builberUIElements = BuilberUIElements.shared


    lazy var customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.addSubview(customTitleLbl)
        view.addSubview(viewButton)
        view.addSubview(infoNameView)
        view.addSubview(infoSurnameView)
        view.addSubview(infoBirthView)
        view.addSubview(infoCitizenshipView)
        view.addSubview(infoPassportView)
        view.addSubview(infoValPassportView)
        return view
    }()
    
    lazy var customTitleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First tourist"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var viewButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.backgroundColor = .appBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 6
        view.addSubview(viewBtn)
        return view
    }()
    
    lazy var viewBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.chevronUpIcon, for: .normal)
        button.tintColor = .appBlue
        button.addTarget(self, action: #selector(viewBtnTap), for: .touchUpInside)
        return button
    }()
    
    lazy var infoNameView = builberUIElements.createLabelTextFieldStack(title: "Name", placeholder: "Nikita")
    lazy var infoSurnameView = builberUIElements.createLabelTextFieldStack(title: "Surname", placeholder: "Kogolenok")
    lazy var infoBirthView = builberUIElements.createLabelTextFieldStack(title: "Birth", placeholder: "22.09.1997")
    lazy var infoCitizenshipView = builberUIElements.createLabelTextFieldStack(title: "Citizenship", placeholder: "Belarus")
    lazy var infoPassportView = builberUIElements.createLabelTextFieldStack(title: "Passport number", placeholder: "PD0303376")
    lazy var infoValPassportView = builberUIElements.createLabelTextFieldStack(title: "Validity of the passport", placeholder: "20.06.2035")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appGray2
        
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(customView)
    }
    
    private func makeConstraints() {
        expandedBottomConstraint = customView.bottomAnchor.constraint(equalTo: infoValPassportView.bottomAnchor, constant: 16)
        collapsedBottomConstraint = customView.bottomAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: 13)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            customTitleLbl.topAnchor.constraint(equalTo: customView.topAnchor, constant: 16),
            customTitleLbl.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            customTitleLbl.trailingAnchor.constraint(equalTo: viewButton.leadingAnchor, constant: -5),
            customTitleLbl.heightAnchor.constraint(equalToConstant: 26),
            
            viewButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 13),
            viewButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            
            viewBtn.centerXAnchor.constraint(equalTo: viewButton.centerXAnchor),
            viewBtn.centerYAnchor.constraint(equalTo: viewButton.centerYAnchor),
            
            infoNameView.topAnchor.constraint(equalTo: customTitleLbl.bottomAnchor, constant: 20),
            infoNameView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoNameView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            //infoView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -16),
            infoNameView.heightAnchor.constraint(equalToConstant: 52),
            
            infoSurnameView.topAnchor.constraint(equalTo: infoNameView.bottomAnchor, constant: 8),
            infoSurnameView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoSurnameView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            infoSurnameView.heightAnchor.constraint(equalToConstant: 52),
            
            infoBirthView.topAnchor.constraint(equalTo: infoSurnameView.bottomAnchor, constant: 8),
            infoBirthView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoBirthView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            infoBirthView.heightAnchor.constraint(equalToConstant: 52),
            
            infoCitizenshipView.topAnchor.constraint(equalTo: infoBirthView.bottomAnchor, constant: 8),
            infoCitizenshipView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoCitizenshipView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            infoCitizenshipView.heightAnchor.constraint(equalToConstant: 52),
            
            infoPassportView.topAnchor.constraint(equalTo: infoCitizenshipView.bottomAnchor, constant: 8),
            infoPassportView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoPassportView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            infoPassportView.heightAnchor.constraint(equalToConstant: 52),
            
            infoValPassportView.topAnchor.constraint(equalTo: infoPassportView.bottomAnchor, constant: 8),
            infoValPassportView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            infoValPassportView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16),
            infoValPassportView.heightAnchor.constraint(equalToConstant: 52),
            
            
            expandedBottomConstraint
        ])
        collapsedBottomConstraint.isActive = false
    }
    
    @objc private func viewBtnTap() {
        if isChevronUpDonw {
            viewBtn.setImage(.chevronDownIcon, for: .normal)
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
            viewBtn.setImage(.chevronUpIcon, for: .normal)
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
}
