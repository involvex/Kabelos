package com.involvex.kabelos.protocol

import java.io.IOException

class ProtocolException(
    val error: ProtocolError,
    message: String
) : IOException(message)

