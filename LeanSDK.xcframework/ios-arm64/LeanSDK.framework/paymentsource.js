function postResponse(status) {
    status.method = "CREATE_PAYMENT_SOURCE"
    if (status.status !== "ERROR" && status.status !== "CANCELLED") {
        window.webkit.messageHandlers.handlePaymentSourceSuccess.postMessage(status);
    } else {
        window.webkit.messageHandlers.handlePaymentSourceFailure.postMessage(status);
    }
}

try {
  Lean.createPaymentSource({
      app_token: "${APP_TOKEN}",
      customer_id: "${CUSTOMER_ID}",
      sandbox: "${SANDBOX}",
      ${BANK_IDENTIFIER}
      callback: postResponse
  })
} catch (e) {
    window.webkit.messageHandlers.handlePaymentSourceFailure.postMessage({message: "Lean not initialized"});
}
