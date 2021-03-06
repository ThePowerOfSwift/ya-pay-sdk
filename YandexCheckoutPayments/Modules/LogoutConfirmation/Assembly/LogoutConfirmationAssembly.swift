import UIKit.UIAlertController

enum LogoutConfirmationAssembly {
    static func makeModule(inputData: LogoutConfirmationModuleInputData,
                           moduleOutput: LogoutConfirmationModuleOutput) -> UIViewController {
        let viewController = UIAlertController(title: String.localizedStringWithFormat(§Localized.titleFormat,
                                                                                       inputData.accountName),
                                               message: nil,
                                               preferredStyle: .alert)
        viewController.addAction(UIAlertAction(title: §CommonLocalized.cancel,
                                               style: .default,
                                               handler: { [weak moduleOutput] _ in
                                                   moduleOutput?.logoutDidCancel(on: viewController)
                                               }))
        viewController.addAction(UIAlertAction(title: §CommonLocalized.ok,
                                               style: .destructive,
                                               handler: { [weak moduleOutput] _ in
                                                   moduleOutput?.logoutDidConfirm(on: viewController)
                                               }))

        return viewController
    }
}

// MARK: - Localized

private enum Localized: String {
    case titleFormat = "LogoutConfirmation.format.title"
}
