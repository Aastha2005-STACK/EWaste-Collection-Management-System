package selenium.ewaste.testing;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

public class EWasteAutomationTest {

    public static void main(String[] args) {

        WebDriver driver = new ChromeDriver();

        WebDriverWait wait =
                new WebDriverWait(driver, Duration.ofSeconds(10));

        try {

            driver.manage().window().maximize();

            driver.get("http://localhost:8080/project/index.jsp");

            System.out.println("--- PART A: BASICS ---");

            System.out.println("Waiting for Welcome Alert...");

            Alert welcomeAlert =
                    wait.until(ExpectedConditions.alertIsPresent());

            System.out.println(
                    "Alert Window Text : "
                    + welcomeAlert.getText()
            );

            Thread.sleep(1000);

            welcomeAlert.accept();

            System.out.println(
                    "Alert handled successfully!"
            );

            Thread.sleep(1000);

            System.out.println(
                    "Captured Page Title : "
                    + driver.getTitle()
            );

            System.out.println(
                    "Captured Current URL: "
                    + driver.getCurrentUrl()
            );

            String source = driver.getPageSource();

            if (source.length() > 100) {

                System.out.println(
                        "Page Source Snippet : "
                        + source.substring(0, 100)
                        + "..."
                );
            }

            driver.navigate().refresh();

            System.out.println(
                    "Page refreshed successfully."
            );

            Alert refreshAlert =
                    wait.until(ExpectedConditions.alertIsPresent());

            System.out.println(
                    "Refresh Alert Text : "
                    + refreshAlert.getText()
            );

            refreshAlert.accept();

            System.out.println(
                    "Refresh alert handled successfully."
            );

            Thread.sleep(1000);

            driver.navigate().to(
                    "http://localhost:8080/project/register.jsp"
            );

            System.out.println(
                    "Navigated to Register Page."
            );

            Thread.sleep(2000);

            driver.navigate().back();

            System.out.println(
                    "Browser navigated back."
            );

            Thread.sleep(1500);

            driver.navigate().forward();

            System.out.println(
                    "Browser navigated forward."
            );

            Thread.sleep(2000);

            System.out.println(
                    "\n===== PART B : WEB ELEMENTS ====="
            );

            WebElement nameField =
                    driver.findElement(
                            By.id("name")
                    );

            WebElement emailField =
                    driver.findElement(
                            By.name("email")
                    );

            WebElement phoneField =
                    driver.findElement(
                            By.id("phone")
                    );

            WebElement addressField =
                    driver.findElement(
                            By.id("address")
                    );

            WebElement wasteSelect =
                    driver.findElement(
                            By.id("waste")
                    );

            System.out.println(
                    "Name field displayed : "
                    + nameField.isDisplayed()
            );

            System.out.println(
                    "Email field enabled : "
                    + emailField.isEnabled()
            );

            nameField.sendKeys(
                    "Amit Sharma"
            );

            emailField.sendKeys(
                    "amit@gmail.com"
            );

            phoneField.sendKeys(
                    "9876543210"
            );

            addressField.sendKeys(
                    "123, Green Park, Delhi"
            );

            System.out.println(
                    "sendKeys() executed."
            );

            emailField.clear();

            emailField.sendKeys(
                    "amit@gmail.com"
            );

            System.out.println(
                    "clear() executed successfully."
            );

            Select dropdown =
                    new Select(wasteSelect);

            dropdown.selectByVisibleText(
                    "Laptop"
            );

            System.out.println(
                    "Laptop selected from dropdown."
            );

            WebElement selectedOption =
                    dropdown.getFirstSelectedOption();

            System.out.println(
                    "Selected option : "
                    + selectedOption.getText()
            );

            System.out.println(
                    "Is selected option selected? : "
                    + selectedOption.isSelected()
            );

            WebElement heading =
                    driver.findElement(
                            By.tagName("h2")
                    );

            System.out.println(
                    "Heading Text : "
                    + heading.getText()
            );

            System.out.println(
                    "Email field name attribute : "
                    + emailField.getAttribute("name")
            );

            WebElement registerLink =
                    driver.findElement(
                            By.linkText("Register")
                    );

            System.out.println(
                    "Register link displayed : "
                    + registerLink.isDisplayed()
            );

            System.out.println(
                    "Register link enabled : "
                    + registerLink.isEnabled()
            );

            System.out.println(
                    "Click command available for Register link."
            );

            System.out.println(
                    "\n===== PART C : LOCATING ELEMENTS ====="
            );

            WebElement idElement =
                    driver.findElement(
                            By.id("name")
                    );

            System.out.println(
                    "ID Locator : "
                    + idElement.getAttribute("id")
            );

            WebElement nameElement =
                    driver.findElement(
                            By.name("email")
                    );

            System.out.println(
                    "Name Locator : "
                    + nameElement.getAttribute("name")
            );

            String actualClass =
                    nameField.getAttribute("class");

            if (actualClass != null &&
                    !actualClass.trim().isEmpty()) {

                String firstClass =
                        actualClass.trim().split("\\s+")[0];

                WebElement classElement =
                        driver.findElement(
                                By.className(firstClass)
                        );

                System.out.println(
                        "ClassName Locator found : "
                        + classElement.isDisplayed()
                );

            } else {

                System.out.println(
                        "ClassName Locator : No class attribute found."
                );
            }

            WebElement linkElement =
                    driver.findElement(
                            By.linkText("Register")
                    );

            System.out.println(
                    "LinkText Locator found : "
                    + linkElement.getText()
            );

            WebElement tagElement =
                    driver.findElement(
                            By.tagName("h2")
                    );

            System.out.println(
                    "TagName Locator : "
                    + tagElement.getText()
            );

            WebElement cssElement =
                    driver.findElement(
                            By.cssSelector("#name")
                    );

            System.out.println(
                    "CSS Selector found : "
                    + cssElement.getAttribute("id")
            );

            WebElement xpathElement =
                    driver.findElement(
                            By.xpath("//*[@id='name']")
                    );

            System.out.println(
                    "XPath Locator found : "
                    + xpathElement.getAttribute("id")
            );

            List<WebElement> options =
                    wasteSelect.findElements(
                            By.tagName("option")
                    );

            System.out.println(
                    "Total dropdown options : "
                    + options.size()
            );

            for (WebElement option : options) {

                System.out.println(
                        "Option : "
                        + option.getText()
                );
            }

            System.out.println(
                    "\n===== SWITCH TO WINDOW ====="
            );

            String currentWindow =
                    driver.getWindowHandle();

            System.out.println(
                    "Current Window Handle : "
                    + currentWindow
            );

            driver.switchTo().window(
                    currentWindow
            );

            System.out.println(
                    "Switched to current browser window."
            );

            System.out.println(
                    "\n================================"
            );

            System.out.println(
                    "SELENIUM TESTING COMPLETED"
            );

            System.out.println(
                    "All required commands executed."
            );

            System.out.println(
                    "================================"
            );

        } catch (Exception e) {

            System.out.println(
                    "Test Failed : "
                    + e.getMessage()
            );

            e.printStackTrace();

        } finally {

            System.out.println(
                    "Browser will remain open."
            );
        }
    }
}