//
// Environment.swift
// Zip4MeApp
//
// Created by Marcos Ferreira on 08/26/24.
//

import Foundation

final class EnvironmentUtil {
    static var versionLabel: String {
        var appVersion = ""

        if let versionInBundle = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = versionInBundle
        }

//        return "Versão: \(selectedEnvironmentName) - \(appVersion)"
        return appVersion
    }

    #if DEBUG
    private enum EnvrionmentType: String {
        case development = "Desenvolvimento"
        case stage = "Pré-Produção"
        case release = "Produção"

        var name: String {
            return self.rawValue
        }
    }
    #else
    static var buildConfigurationForDisplay: String {
        return ""
    }
    #endif
}
