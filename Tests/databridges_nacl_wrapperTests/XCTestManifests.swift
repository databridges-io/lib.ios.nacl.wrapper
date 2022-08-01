import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(databridges_nacl_wrapper.allTests),
    ]
}
#endif
