package projTest.uitest.proj;

import java.io.File;
import java.net.URL;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;

import org.junit.After;
import org.junit.Before;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ById;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class AppiumTest {
	private AppiumDriver driver;

	private AppiumDriver getAndroidDriver() throws Exception {
		String appPath = System.getProperty("appPath");
		System.out.println(appPath);
		DesiredCapabilities capabilities = new DesiredCapabilities(); 
		capabilities.setCapability("deviceName", "Android Emulator");
		capabilities.setCapability("app", new File(appPath));
		return new AndroidDriver(new URL("http://127.0.0.1:4723/wd/hub"),
				capabilities);
	}

	@Before
	public void setUp() throws Exception {
		// TODO: choose proper driver
			driver = getAndroidDriver();		
			driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
	
	}

	@After
	public void tearDown() throws Exception {
		if (driver != null) {
			driver.quit();
		}
	}

	public AppiumDriver platformDriver() {
		return driver;
	}

	public WebElement findElement(String name) {
		return driver.findElementByAccessibilityId(name);
	}

	protected boolean isElementPresent(By by) {
		try {
			driver.findElement(by);
			return true;
		} catch (org.openqa.selenium.NoSuchElementException e) {
			return false;
		}
	}

}
