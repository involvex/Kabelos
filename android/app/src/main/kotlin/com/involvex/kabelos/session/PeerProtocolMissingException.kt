package com.involvex.kabelos.session

import java.io.IOException

class PeerProtocolMissingException(
    message: String,
    cause: Throwable? = null,
    val failureReason: String = "protocol_mismatch"
) :
    IOException(message, cause)

