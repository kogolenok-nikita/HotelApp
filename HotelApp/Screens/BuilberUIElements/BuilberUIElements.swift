import UIKit

class BuilberUIElements {
    static let shared = BuilberUIElements()
    private init() { }
    
    func createNavigationView(titleLabel: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        
        let iconBtn = UIButton()
        iconBtn.translatesAutoresizingMaskIntoConstraints = false
        iconBtn.setImage(.chevronLeftIcon, for: .normal)
        iconBtn.widthAnchor.constraint(equalToConstant: 44).isActive = true
        iconBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        iconBtn.tintColor = .black
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titleLabel
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
        
        
        view.addSubview(iconBtn)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            iconBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            iconBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
        return view
    }
    
    func createImageView(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: imageName)
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }
    
    func createTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 0
        return label
    }
    
    func createBlueBtn(title: String) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.appBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return btn
    }
    
    func createPriceLabel(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 0
        return label
    }
    
    func createGray2Label(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = .appGray2
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }
    
    func createBlackLabel(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }
    
    func createStarStackView(text: String) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.backgroundColor = .appYellow.withAlphaComponent(0.2)
        stack.layer.cornerRadius = 5
        
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = .starIcon
        icon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        icon.tintColor = .appYellow2
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .appYellow2
        label.numberOfLines = 0
        
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(label)
        return stack
    }
    
    func createBodyView(withText text: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray
        view.layer.cornerRadius = 5
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .appGray2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        return view
    }
    
    func createBottomViewWithButton(buttomTitle: String, target: Any?, action: Selector) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appWhite
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(buttomTitle, for: .normal)
        btn.setTitleColor(.appWhite, for: .normal)
        btn.backgroundColor = .appBlue
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.layer.cornerRadius = 15
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            btn.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        return view
    }
    
    func createButton(buttomTitle: String, target: Any?, action: Selector) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(buttomTitle, for: .normal)
        btn.setTitleColor(.appWhite, for: .normal)
        btn.backgroundColor = .appBlue
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.layer.cornerRadius = 15
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    func createLabelTextFieldStack(title: String, placeholder: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray3
        view.layer.cornerRadius = 10
        
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .leading
        stack.distribution = .fill

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.textColor = .appGray4
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.numberOfLines = 0

        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.placeholder = placeholder

        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(textField)
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])

        return view
    }

    func createChevronView(target: Any?, action: Selector) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.backgroundColor = .appBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 6
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.chevronUpIcon, for: .normal)
        button.tintColor = .appBlue
        button.addTarget(target, action: action, for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        return view
    }
}
