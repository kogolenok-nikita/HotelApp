import UIKit

protocol BookingPresenterProtocol: AnyObject {
    func attechView(_ view: BookingViewProtocol)
    func viewDidLoad()
    func didTapContinue()
    func didTapBack()
}

class BookingPresenter: BookingPresenterProtocol {
    private weak var view: BookingViewProtocol?
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func attechView(_ view: BookingViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func didTapContinue() {
        router.navigateToSuccess()
    }
    
    func didTapBack() {
        router.popToRoot()
    }
}
