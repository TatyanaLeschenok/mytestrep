package projTest.uitest.proj;

import static org.junit.Assert.*;

import org.junit.Test;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SimpleTest extends AppiumTest{

	@Test
	public void test() {
		WebElement button = platformDriver().findElementById("new_screen_button");
		button.click();
		
		WebDriverWait wait = new WebDriverWait(platformDriver(), 10);
		wait.until(ExpectedConditions.visibilityOf(platformDriver().findElementById("second_text")));
				
	}

}
