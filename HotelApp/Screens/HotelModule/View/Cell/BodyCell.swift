import UIKit

class BodyCell: UITableViewCell {
    
    // MARK: - Variable
    static let identifier = "BodyCell"
    
    // MARK: - GUI Variables
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconLeft)
        view.addSubview(labelsStack)
        view.addSubview(iconRight)
        return view
    }()
    
    lazy var iconLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .happyIcon
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(detailLabel)
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .appGray2
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var iconRight: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .chevronRightIcon
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appGray2
        return view
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    private func addSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(lineView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            containerView.heightAnchor.constraint(equalToConstant: 38),
            
            iconLeft.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconLeft.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            labelsStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            labelsStack.leadingAnchor.constraint(equalTo: iconLeft.trailingAnchor, constant: 12),
            labelsStack.trailingAnchor.constraint(equalTo: iconRight.leadingAnchor, constant: -5),
            
            iconRight.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconRight.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            
            lineView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 53),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func setBodyModel(model: BodyModel) {
        iconLeft.image = UIImage(named: model.icon)
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
}
