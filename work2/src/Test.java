import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;
public class Test {
	public static void main(String[] args) {
       Locale locale=new Locale("zh", "CN");
		//Locale locale=new Locale("en", "US");
        ResourceBundle rb=ResourceBundle.getBundle("i18n",locale);
        String s=rb.getString("a");
        System.out.println(s);
        String c=rb.getString("c");
        String c1=MessageFormat.format(c, "","");
        System.out.println(c1);
	}
}
