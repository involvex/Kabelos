package com.involvex.kabelos

import android.os.Handler
import android.os.Looper
import com.involvex.kabelos.session.SessionManager
import io.flutter.plugin.common.MethodChannel

class ChatService(
    private val sessionManager: SessionManager,
    private val methodChannel: MethodChannel
) {
    private val mainHandler = Handler(Looper.getMainLooper())
    
    fun sendData(data: String?, result: MethodChannel.Result) {
        if (data == null) {
            result.error("INVALID_ARGUMENT", "Data is required", null)
            return
        }

        try {
            sessionManager.sendChatMessage(data, result)
        } catch (e: Exception) {
            mainHandler.post {
                result.error("SEND_ERROR", "Failed to send data: ${e.message}", null)
                methodChannel.invokeMethod("onError", "Send error: ${e.message}")
            }
        }
    }
}

