package com.involvex.kabelos.audio

import com.involvex.kabelos.protocol.ProtocolConstants
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AudioCapabilitiesTest {
    @Test
    fun peerAudioSupportRequiresBaseRtpLibopusCapabilitiesOnly() {
        val required = AudioCapabilities.requiredAudioCapabilities.toSet()

        assertTrue(AudioCapabilities.peerSupportsAudio(required))
        assertFalse(AudioCapabilities.peerSupportsAudio(required - ProtocolConstants.CAPABILITY_AUDIO_RTCP))
        assertTrue(AudioCapabilities.peerSupportsAudio(required + ProtocolConstants.CAPABILITY_AUDIO_QUALITY_SELECT))
    }

    @Test
    fun qualitySelectionIsOptionalAndCheckedSeparately() {
        assertFalse(AudioCapabilities.peerSupportsAudioQualitySelection(AudioCapabilities.requiredAudioCapabilities.toSet()))
        assertTrue(
            AudioCapabilities.peerSupportsAudioQualitySelection(
                setOf(ProtocolConstants.CAPABILITY_AUDIO_QUALITY_SELECT)
            )
        )
    }
}

