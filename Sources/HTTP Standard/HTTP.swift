public import RFC_9110
public import RFC_9112

public typealias HTTP = RFC_9110

extension RFC_9110.Version {
    public enum `1` {}
}

extension RFC_9110.Version.`1` {
    public typealias `1` = RFC_9112
}
