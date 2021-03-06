function postResponse(status) {
    status.method = "LINK"
    if (status.status !== "ERROR" && status.status !== "CANCELLED") {
        window.webkit.messageHandlers.handleReconnectSuccess.postMessage(status);
    } else {
        window.webkit.messageHandlers.handleReconnectFailure.postMessage(status);
    }
}

try {
  Lean.reconnect({
      app_token: "${APP_TOKEN}",
      reconnect_id: "${RECONNECT_ID}",
      customer_id: "${CUSTOMER_ID}",
      sandbox: "${SANDBOX}",
      callback: postResponse
  })
} catch (e) {
    window.webkit.messageHandlers.handleReconnectFailure.postMessage({message: "Lean not initialized"});
}
