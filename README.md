# HTTP

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The `HTTP` namespace for Swift: an umbrella over the RFC 9110 semantics package that maps each of its top-level types (`Authentication`, `Date`, `Field`, `MediaType`, `Message`, `Method`, `Negotiation`, `Parameter`, `Precondition`, `Representation`, `Status`, `Target`, `Token`, `Version`) onto `HTTP.*`, so consumers reach the version-independent vocabulary through `import HTTP` and one dependency. Per-version and per-concern siblings extend the same namespace without widening this package: `swift-http-1-1` (RFC 9112, ``HTTP.`1`.`1` ``), `swift-http-2` (RFC 9113 and RFC 7541), `swift-http-3` (RFC 9114 and RFC 9204), `swift-http-cache` (RFC 9111), and `swift-http-cookie` (RFC 6265), each with a `-coder` facade over the corresponding RFC coder.

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-http.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "HTTP", package: "swift-http")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
