package com.pravera.geofencing_api;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import org.junit.Test;

/** This demonstrates a simple unit test of the Java portion of this plugin's implementation. */
public class GeofencingApiPluginTest {
  @Test
  public void onMethodCall_getPlatformVersion_returnsExpectedValue() {
    GeofencingApiPlugin plugin = new GeofencingApiPlugin();

    final MethodCall call = new MethodCall("getPlatformVersion", null);
    MethodChannel.Result mockResult = mock(MethodChannel.Result.class);
    plugin.onMethodCall(call, mockResult);

    verify(mockResult).success("Android " + android.os.Build.VERSION.RELEASE);
  }
}
