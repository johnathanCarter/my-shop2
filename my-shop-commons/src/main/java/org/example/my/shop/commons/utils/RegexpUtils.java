package org.example.my.shop.commons.utils;

public class RegexpUtils {

    /**
     * number
     */
    public static final String PHONE = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d[8]$";

    /**
     * email
     */
    public static final String EMAIL = "\\w+(\\. \\w)*@\\w+(\\. \\w{2,3}){1,3}";

    /**
     * check phone number
     */
    public static boolean checkNumber(String phone) {
        return phone.matches(PHONE);
    }

    /**
     * check the emial
     */
    public static boolean checkEmail(String email) {
        return email.matches(EMAIL);
    }
}
