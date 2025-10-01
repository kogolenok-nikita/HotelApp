import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController { get }
    var builder: BuilderProtocol { get }
    func initialViewController()
    func navigateToRoom()
    func navigationToBooking()
    func navigateToSuccess()
    func popToRoot()
}

class Router: RouterProtocol {
    let navigationController: UINavigationController
    var builder: BuilderProtocol
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        navigationController.setNavigationBarHidden(true, animated: false)
        let hotel = builder.createHotelModule(router: self)
        navigationController.viewControllers = [hotel]
    }
    
    func navigateToRoom() {
        let room = builder.createRoomModele(router: self)
        navigationController.pushViewController(room, animated: true)
    }
    
    func navigationToBooking() {
        let booking = builder.createBookingModule(router: self)
        navigationController.pushViewController(booking, animated: true)
    }
    
    func navigateToSuccess() {
        let success = builder.createSuccessModule(router: self)
        navigationController.pushViewController(success, animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
