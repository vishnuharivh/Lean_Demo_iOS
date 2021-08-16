function postResponse(status) {
    status.method = "LINK"
    if (status.status !== "ERROR" && status.status !== "CANCELLED") {
        window.webkit.messageHandlers.handlePaySuccess.postMessage(status);
    } else {
        window.webkit.messageHandlers.handlePayFailure.postMessage(status);
    }
}

try {
  Lean.pay({
      app_token: "${APP_TOKEN}",
      payment_intent_id: "${PAYMENT_INTENT_ID}",
      sandbox: "${SANDBOX}",
      ${ACCOUNT_ID}
      callback: postResponse
  })
} catch (e) {
    window.webkit.messageHandlers.handlePayFailure.postMessage({message: "Lean not initialized"});
}
