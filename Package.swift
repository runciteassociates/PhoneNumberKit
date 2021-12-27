// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RuncitePhoneNumberKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "RuncitePhoneNumberKit", targets: ["RuncitePhoneNumberKit"]),
        .library(name: "RuncitePhoneNumberKit-Static", type: .static, targets: ["RuncitePhoneNumberKit"]),
        .library(name: "RuncitePhoneNumberKit-Dynamic", type: .dynamic, targets: ["RuncitePhoneNumberKit"])
    ],
    targets: [
        .target(name: "RuncitePhoneNumberKit",
                path: "RuncitePhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update.sh",
                          "Info.plist", 
                          "Bundle+Resources.swift"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json")
                ]),
        .testTarget(name: "RuncitePhoneNumberKitTests",
                    dependencies: ["RuncitePhoneNumberKit"],
                    path: "RuncitePhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
