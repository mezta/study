package com.util;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.bean.User;

@Component
public class CardValidator implements Validator
{
	public static final String regex_telephone = "^0{0,1}(1[0-9][0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$";
	public static final String regex_email = "^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$";

	
	public static boolean istelepone(String telephone) 
	{
        return Pattern.matches(regex_telephone, telephone);
    }

	public static boolean isEmail(String email) 
	{
        return Pattern.matches(regex_email, email);
    }


	
	
	@Override
	public boolean supports(Class<?> klass) 
	{
		return User.class.isAssignableFrom(klass);
	}

	@Override
	public void validate(Object object, Errors errors)
	{
		User user=(User)object;
		ValidationUtils.rejectIfEmpty(errors, "uname", "用户名必填");
		ValidationUtils.rejectIfEmpty(errors, "telephone", "电话必填");
		if(!istelepone(user.getTelephone()))
		{
			errors.rejectValue("telephone", "电话号码无效");
		}
		if(!isEmail(user.getEmail()))
		{
			errors.rejectValue("email", "email无效");
		}
	}

}
