import UIKit

protocol SuccessPresenterProtocol: AnyObject {
    func attechView(_ view: SuccessViewProtocol)
    func viewDidLoad()
    func didTapContinue()
    func didTapBack()
}

class SuccessPresenter: SuccessPresenterProtocol {
    private weak var view: SuccessViewProtocol?
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func attechView(_ view: SuccessViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func didTapContinue() {
        
    }
    
    func didTapBack() {
        router.popToRoot()
    }
}
