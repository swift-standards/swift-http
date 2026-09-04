import Byte
import HTTP
import RFC_9110
import Testing

extension HTTP {
    @Suite("HTTP Tests")
    struct Test {
        @Suite
        struct Unit {

            @Test
            func `method vocabulary reaches through the HTTP names`() {
                #expect(HTTP.Method.get.isSafe)
                #expect(HTTP.Method.get.isIdempotent)
                #expect(!HTTP.Method.post.isSafe)
            }

            @Test
            func `status vocabulary reaches through the HTTP names`() {
                #expect(HTTP.Status.ok.isSuccessful)
                #expect(HTTP.Status.ok != HTTP.Status.created)
            }

            @Test
            func `version is constructed through the HTTP names`() throws {
                let version = try HTTP.Version(major: 1, minor: 1)
                #expect(version.major == 1)
                #expect(version.minor == 1)
            }

            @Test
            func `request is built and read through the HTTP names`() throws {
                let body: [Byte] = "increment".utf8.map(Byte.init(bitPattern:))
                let request = HTTP.Message.Request<[Byte]>(
                    method: .post,
                    target: HTTP.Target(unchecked: "/counter"),
                    headers: [
                        try HTTP.Field(name: "Content-Type", value: "text/plain")
                    ],
                    content: body
                )
                #expect(request.method == HTTP.Method.post)
                #expect(request.target == HTTP.Target(unchecked: "/counter"))
                #expect(request.headers.count == 1)
                #expect(request.content == body)
                #expect(request.trailers.isEmpty)
            }
        }
    }
}
