import Foundation

class RootAssembly {
    lazy var presentationAssembly: PresentationAssemblyProtocol = PresentationAssembly(serviceAssembly: serviceAssembly)
    private lazy var serviceAssembly: ServiceAssemblyProtocol = ServiceAssembly()
}
