// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RuncitePhoneNumberKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "RuncitePhoneNumberKit", targets: ["PhoneNumberKit"]),
        .library(name: "RuncitePhoneNumberKit-Static", type: .static, targets: ["PhoneNumberKit"]),
        .library(name: "RuncitePhoneNumberKit-Dynamic", type: .dynamic, targets: ["PhoneNumberKit"])
    ],
    targets: [
        .target(name: "PhoneNumberKit",
                path: "PhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update.sh",
                          "Info.plist", 
                          "Bundle+Resources.swift"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json")
                ]),
        .testTarget(name: "PhoneNumberKitTests",
                    dependencies: ["PhoneNumberKit"],
                    path: "PhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
