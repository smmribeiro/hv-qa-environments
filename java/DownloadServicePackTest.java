import java.io.File;

import java.nio.file.Files;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;

public class DownloadServicePackTest {
	public static void main ( String arguments[] ) throws Exception {
		if ( arguments.length < 3 ) {
			System.out.println( "The right way of calling this file is: DownloadServicePackTest box-username box-password service-pack [headless]" );
			System.exit( 1 );
		}

		String boxUsername = arguments[0];
		System.out.println("boxUsername" + " = " + boxUsername);

		String boxPassword = arguments[1];
		System.out.println("boxPassword" + " = " + boxPassword);

		String servicePack = arguments[2];
		System.out.println("servicePack" + " = " + servicePack);

		String filePath = "/host/builds/sp/" + servicePack;
		File file = new File( filePath );

		if ( file.exists() ) {
			System.out.println( "file " + servicePack + " already exists in builds path, moving on" );
			System.exit( 0 );
		}

		filePath = "/home/vagrant/Downloads/" + servicePack;
		file = new File( filePath );

		if ( file.exists() ) {
			System.out.println( "file " + servicePack + " already exists in downloads, moving to builds path" );

			Path movefrom = FileSystems.getDefault().getPath( filePath );
			Path target = FileSystems.getDefault().getPath( "/host/builds/sp/" + servicePack );
			Files.move( movefrom, target, StandardCopyOption.REPLACE_EXISTING );

			System.exit( 0 );
		}

		System.setProperty( "webdriver.chrome.driver", "/usr/bin/chromedriver" );

		ChromeOptions chromeOptions = new ChromeOptions();

		if ( arguments.length >= 4 && ( arguments[3] ).equals( "headless" ) ) {
			chromeOptions.addArguments( "--headless" );
		}

		chromeOptions.addArguments( "--no-sandbox" );

		WebDriver driver = new ChromeDriver( chromeOptions );

		driver.get( "https://pentaho.account.box.com/login" );

		Thread.sleep( 1000 );

		driver.findElement( By.id( "login-email" ) ).sendKeys( boxUsername );

		Thread.sleep( 1000 );

		driver.findElement( By.id( "login-submit" ) ).click();

		Thread.sleep( 1000 );

		driver.findElement( By.id( "password-login" ) ).sendKeys( boxPassword );

		Thread.sleep( 1000 );

		driver.findElement( By.id( "login-submit-password" ) ).click();

		Thread.sleep( 1000 );

		driver.findElement( By.cssSelector( "div.quick-search-selector input" ) ).sendKeys( servicePack );

		Thread.sleep( 1000 );

		driver.findElement( By.cssSelector( "div.action-buttons .action-button.search-button" )).click();

		Thread.sleep( 10000 );

		driver.findElement( By.linkText( servicePack ) ).click();

		Thread.sleep( 10000 );

		driver.findElement( By.cssSelector( "button.bp-btn.bp-btn-primary" ) ).click();

		boolean fileExists = false;

		do {
			System.out.println( "waiting for " + servicePack + " to be downloaded" );

			fileExists = file.exists();

			Thread.sleep( 5000 );
		} while ( !fileExists );

		Path movefrom = FileSystems.getDefault().getPath( filePath );
		Path target = FileSystems.getDefault().getPath( "/host/builds/sp/" + servicePack );
		Files.move( movefrom, target, StandardCopyOption.REPLACE_EXISTING );

		System.out.println( "service pack " + servicePack + " available in builds path" );

		driver.quit();

		System.exit( 0 );
	}
}
