//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: build/bazel/remote/asset/v1/remote_asset.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import GRPC
import NIO
import NIOHTTP1
import SwiftProtobuf


/// Usage: instantiate Build_Bazel_Remote_Asset_V1_FetchClient, then call methods of this protocol to make API calls.
public protocol Build_Bazel_Remote_Asset_V1_FetchClientProtocol {
  func fetchBlob(_ request: Build_Bazel_Remote_Asset_V1_FetchBlobRequest, callOptions: CallOptions?) -> UnaryCall<Build_Bazel_Remote_Asset_V1_FetchBlobRequest, Build_Bazel_Remote_Asset_V1_FetchBlobResponse>
  func fetchDirectory(_ request: Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest, callOptions: CallOptions?) -> UnaryCall<Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest, Build_Bazel_Remote_Asset_V1_FetchDirectoryResponse>
}

public final class Build_Bazel_Remote_Asset_V1_FetchClient: GRPCClient, Build_Bazel_Remote_Asset_V1_FetchClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions

  /// Creates a client for the build.bazel.remote.asset.v1.Fetch service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  public init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }

  /// Resolve or fetch referenced assets, making them available to the caller and
  /// other consumers in the [ContentAddressableStorage][build.bazel.remote.execution.v2.ContentAddressableStorage].
  ///
  /// Servers *MAY* fetch content that they do not already have cached, for any
  /// URLs they support.
  ///
  /// Servers *SHOULD* ensure that referenced files are present in the CAS at the
  /// time of the response, and (if supported) that they will remain available
  /// for a reasonable period of time. The lifetimes of the referenced blobs *SHOULD*
  /// be increased if necessary and applicable.
  /// In the event that a client receives a reference to content that is no
  /// longer present, it *MAY* re-issue the request with
  /// `oldest_content_accepted` set to a more recent timestamp than the original
  /// attempt, to induce a re-fetch from origin.
  ///
  /// Servers *MAY* cache fetched content and reuse it for subsequent requests,
  /// subject to `oldest_content_accepted`.
  ///
  /// Servers *MAY* support the complementary [Push][build.bazel.remote.asset.v1.Push]
  /// API and allow content to be directly inserted for use in future fetch
  /// responses.
  ///
  /// Servers *MUST* ensure Fetch'd content matches all the specified
  /// qualifiers except in the case of previously Push'd resources, for which
  /// the server *MAY* trust the pushing client to have set the qualifiers
  /// correctly, without validation.
  ///
  /// Servers not implementing the complementary [Push][build.bazel.remote.asset.v1.Push]
  /// API *MUST* reject requests containing qualifiers it does not support.
  ///
  /// Servers *MAY* transform assets as part of the fetch. For example a
  /// tarball fetched by [FetchDirectory][build.bazel.remote.asset.v1.Fetch.FetchDirectory]
  /// might be unpacked, or a Git repository
  /// fetched by [FetchBlob][build.bazel.remote.asset.v1.Fetch.FetchBlob]
  /// might be passed through `git-archive`.
  ///
  /// Errors handling the requested assets will be returned as gRPC Status errors
  /// here; errors outside the server's control will be returned inline in the
  /// `status` field of the response (see comment there for details).
  /// The possible RPC errors include:
  /// * `INVALID_ARGUMENT`: One or more arguments were invalid, such as a
  ///   qualifier that is not supported by the server.
  /// * `RESOURCE_EXHAUSTED`: There is insufficient quota of some resource to
  ///   perform the requested operation. The client may retry after a delay.
  /// * `UNAVAILABLE`: Due to a transient condition the operation could not be
  ///   completed. The client should retry.
  /// * `INTERNAL`: An internal error occurred while performing the operation.
  ///   The client should retry.
  /// * `DEADLINE_EXCEEDED`: The fetch could not be completed within the given
  ///   RPC deadline. The client should retry for at least as long as the value
  ///   provided in `timeout` field of the request.
  ///
  /// In the case of unsupported qualifiers, the server *SHOULD* additionally
  /// send a [BadRequest][google.rpc.BadRequest] error detail where, for each
  /// unsupported qualifier, there is a `FieldViolation` with a `field` of
  /// `qualifiers.name` and a `description` of `"{qualifier}" not supported`
  /// indicating the name of the unsupported qualifier.
  ///
  /// - Parameters:
  ///   - request: Request to send to FetchBlob.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func fetchBlob(
    _ request: Build_Bazel_Remote_Asset_V1_FetchBlobRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Build_Bazel_Remote_Asset_V1_FetchBlobRequest, Build_Bazel_Remote_Asset_V1_FetchBlobResponse> {
    return self.makeUnaryCall(
      path: "/build.bazel.remote.asset.v1.Fetch/FetchBlob",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to FetchDirectory
  ///
  /// - Parameters:
  ///   - request: Request to send to FetchDirectory.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func fetchDirectory(
    _ request: Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest, Build_Bazel_Remote_Asset_V1_FetchDirectoryResponse> {
    return self.makeUnaryCall(
      path: "/build.bazel.remote.asset.v1.Fetch/FetchDirectory",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

/// Usage: instantiate Build_Bazel_Remote_Asset_V1_PushClient, then call methods of this protocol to make API calls.
public protocol Build_Bazel_Remote_Asset_V1_PushClientProtocol {
  func pushBlob(_ request: Build_Bazel_Remote_Asset_V1_PushBlobRequest, callOptions: CallOptions?) -> UnaryCall<Build_Bazel_Remote_Asset_V1_PushBlobRequest, Build_Bazel_Remote_Asset_V1_PushBlobResponse>
  func pushDirectory(_ request: Build_Bazel_Remote_Asset_V1_PushDirectoryRequest, callOptions: CallOptions?) -> UnaryCall<Build_Bazel_Remote_Asset_V1_PushDirectoryRequest, Build_Bazel_Remote_Asset_V1_PushDirectoryResponse>
}

public final class Build_Bazel_Remote_Asset_V1_PushClient: GRPCClient, Build_Bazel_Remote_Asset_V1_PushClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions

  /// Creates a client for the build.bazel.remote.asset.v1.Push service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  public init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }

  /// These APIs associate the identifying information of a resource, as
  /// indicated by URI and optionally Qualifiers, with content available in the
  /// CAS. For example, associating a repository url and a commit id with a
  /// Directory Digest.
  ///
  /// Servers *SHOULD* only allow trusted clients to associate content, and *MAY*
  /// only allow certain URIs to be pushed.
  ///
  /// Clients *MUST* ensure associated content is available in CAS prior to
  /// pushing.
  ///
  /// Clients *MUST* ensure the Qualifiers listed correctly match the contents,
  /// and Servers *MAY* trust these values without validation.
  /// Fetch servers *MAY* require exact match of all qualifiers when returning
  /// content previously pushed, or allow fetching content with only a subset of
  /// the qualifiers specified on Push.
  ///
  /// Clients can specify expiration information that the server *SHOULD*
  /// respect. Subsequent requests can be used to alter the expiration time.
  ///
  /// A minimal compliant Fetch implementation may support only Push'd content
  /// and return `NOT_FOUND` for any resource that was not pushed first.
  /// Alternatively, a compliant implementation may choose to not support Push
  /// and only return resources that can be Fetch'd from origin.
  ///
  /// Errors will be returned as gRPC Status errors.
  /// The possible RPC errors include:
  /// * `INVALID_ARGUMENT`: One or more arguments to the RPC were invalid.
  /// * `RESOURCE_EXHAUSTED`: There is insufficient quota of some resource to
  ///   perform the requested operation. The client may retry after a delay.
  /// * `UNAVAILABLE`: Due to a transient condition the operation could not be
  ///   completed. The client should retry.
  /// * `INTERNAL`: An internal error occurred while performing the operation.
  ///   The client should retry.
  ///
  /// - Parameters:
  ///   - request: Request to send to PushBlob.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func pushBlob(
    _ request: Build_Bazel_Remote_Asset_V1_PushBlobRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Build_Bazel_Remote_Asset_V1_PushBlobRequest, Build_Bazel_Remote_Asset_V1_PushBlobResponse> {
    return self.makeUnaryCall(
      path: "/build.bazel.remote.asset.v1.Push/PushBlob",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to PushDirectory
  ///
  /// - Parameters:
  ///   - request: Request to send to PushDirectory.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func pushDirectory(
    _ request: Build_Bazel_Remote_Asset_V1_PushDirectoryRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Build_Bazel_Remote_Asset_V1_PushDirectoryRequest, Build_Bazel_Remote_Asset_V1_PushDirectoryResponse> {
    return self.makeUnaryCall(
      path: "/build.bazel.remote.asset.v1.Push/PushDirectory",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Build_Bazel_Remote_Asset_V1_FetchProvider: CallHandlerProvider {
  /// Resolve or fetch referenced assets, making them available to the caller and
  /// other consumers in the [ContentAddressableStorage][build.bazel.remote.execution.v2.ContentAddressableStorage].
  ///
  /// Servers *MAY* fetch content that they do not already have cached, for any
  /// URLs they support.
  ///
  /// Servers *SHOULD* ensure that referenced files are present in the CAS at the
  /// time of the response, and (if supported) that they will remain available
  /// for a reasonable period of time. The lifetimes of the referenced blobs *SHOULD*
  /// be increased if necessary and applicable.
  /// In the event that a client receives a reference to content that is no
  /// longer present, it *MAY* re-issue the request with
  /// `oldest_content_accepted` set to a more recent timestamp than the original
  /// attempt, to induce a re-fetch from origin.
  ///
  /// Servers *MAY* cache fetched content and reuse it for subsequent requests,
  /// subject to `oldest_content_accepted`.
  ///
  /// Servers *MAY* support the complementary [Push][build.bazel.remote.asset.v1.Push]
  /// API and allow content to be directly inserted for use in future fetch
  /// responses.
  ///
  /// Servers *MUST* ensure Fetch'd content matches all the specified
  /// qualifiers except in the case of previously Push'd resources, for which
  /// the server *MAY* trust the pushing client to have set the qualifiers
  /// correctly, without validation.
  ///
  /// Servers not implementing the complementary [Push][build.bazel.remote.asset.v1.Push]
  /// API *MUST* reject requests containing qualifiers it does not support.
  ///
  /// Servers *MAY* transform assets as part of the fetch. For example a
  /// tarball fetched by [FetchDirectory][build.bazel.remote.asset.v1.Fetch.FetchDirectory]
  /// might be unpacked, or a Git repository
  /// fetched by [FetchBlob][build.bazel.remote.asset.v1.Fetch.FetchBlob]
  /// might be passed through `git-archive`.
  ///
  /// Errors handling the requested assets will be returned as gRPC Status errors
  /// here; errors outside the server's control will be returned inline in the
  /// `status` field of the response (see comment there for details).
  /// The possible RPC errors include:
  /// * `INVALID_ARGUMENT`: One or more arguments were invalid, such as a
  ///   qualifier that is not supported by the server.
  /// * `RESOURCE_EXHAUSTED`: There is insufficient quota of some resource to
  ///   perform the requested operation. The client may retry after a delay.
  /// * `UNAVAILABLE`: Due to a transient condition the operation could not be
  ///   completed. The client should retry.
  /// * `INTERNAL`: An internal error occurred while performing the operation.
  ///   The client should retry.
  /// * `DEADLINE_EXCEEDED`: The fetch could not be completed within the given
  ///   RPC deadline. The client should retry for at least as long as the value
  ///   provided in `timeout` field of the request.
  ///
  /// In the case of unsupported qualifiers, the server *SHOULD* additionally
  /// send a [BadRequest][google.rpc.BadRequest] error detail where, for each
  /// unsupported qualifier, there is a `FieldViolation` with a `field` of
  /// `qualifiers.name` and a `description` of `"{qualifier}" not supported`
  /// indicating the name of the unsupported qualifier.
  func fetchBlob(request: Build_Bazel_Remote_Asset_V1_FetchBlobRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Build_Bazel_Remote_Asset_V1_FetchBlobResponse>
  func fetchDirectory(request: Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Build_Bazel_Remote_Asset_V1_FetchDirectoryResponse>
}

extension Build_Bazel_Remote_Asset_V1_FetchProvider {
  public var serviceName: String { return "build.bazel.remote.asset.v1.Fetch" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handleMethod(_ methodName: String, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "FetchBlob":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.fetchBlob(request: request, context: context)
        }
      }

    case "FetchDirectory":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.fetchDirectory(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Build_Bazel_Remote_Asset_V1_PushProvider: CallHandlerProvider {
  /// These APIs associate the identifying information of a resource, as
  /// indicated by URI and optionally Qualifiers, with content available in the
  /// CAS. For example, associating a repository url and a commit id with a
  /// Directory Digest.
  ///
  /// Servers *SHOULD* only allow trusted clients to associate content, and *MAY*
  /// only allow certain URIs to be pushed.
  ///
  /// Clients *MUST* ensure associated content is available in CAS prior to
  /// pushing.
  ///
  /// Clients *MUST* ensure the Qualifiers listed correctly match the contents,
  /// and Servers *MAY* trust these values without validation.
  /// Fetch servers *MAY* require exact match of all qualifiers when returning
  /// content previously pushed, or allow fetching content with only a subset of
  /// the qualifiers specified on Push.
  ///
  /// Clients can specify expiration information that the server *SHOULD*
  /// respect. Subsequent requests can be used to alter the expiration time.
  ///
  /// A minimal compliant Fetch implementation may support only Push'd content
  /// and return `NOT_FOUND` for any resource that was not pushed first.
  /// Alternatively, a compliant implementation may choose to not support Push
  /// and only return resources that can be Fetch'd from origin.
  ///
  /// Errors will be returned as gRPC Status errors.
  /// The possible RPC errors include:
  /// * `INVALID_ARGUMENT`: One or more arguments to the RPC were invalid.
  /// * `RESOURCE_EXHAUSTED`: There is insufficient quota of some resource to
  ///   perform the requested operation. The client may retry after a delay.
  /// * `UNAVAILABLE`: Due to a transient condition the operation could not be
  ///   completed. The client should retry.
  /// * `INTERNAL`: An internal error occurred while performing the operation.
  ///   The client should retry.
  func pushBlob(request: Build_Bazel_Remote_Asset_V1_PushBlobRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Build_Bazel_Remote_Asset_V1_PushBlobResponse>
  func pushDirectory(request: Build_Bazel_Remote_Asset_V1_PushDirectoryRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Build_Bazel_Remote_Asset_V1_PushDirectoryResponse>
}

extension Build_Bazel_Remote_Asset_V1_PushProvider {
  public var serviceName: String { return "build.bazel.remote.asset.v1.Push" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handleMethod(_ methodName: String, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "PushBlob":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.pushBlob(request: request, context: context)
        }
      }

    case "PushDirectory":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.pushDirectory(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}


// Provides conformance to `GRPCPayload`
extension Build_Bazel_Remote_Asset_V1_Qualifier: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_FetchBlobRequest: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_FetchBlobResponse: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_FetchDirectoryRequest: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_FetchDirectoryResponse: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_PushBlobRequest: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_PushBlobResponse: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_PushDirectoryRequest: GRPCProtobufPayload {}
extension Build_Bazel_Remote_Asset_V1_PushDirectoryResponse: GRPCProtobufPayload {}
