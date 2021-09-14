package org.example.my.shop.commons.dto;

import java.io.Serializable;

/**
 * custom response result
 */
public class BaseResult implements Serializable {
    private static final int SUCCESS = 200;
    private static final int FAILURE = 500;

    private int status;
    private String message;

    public static BaseResult success() {
        return setBaseResult(SUCCESS, "success");
    }

    public static BaseResult failure() {
        return setBaseResult(FAILURE, "failure");
    }

    public static BaseResult success(String message) {
        return setBaseResult(SUCCESS, message);
    }

    public static BaseResult failure(String message) {
        return setBaseResult(FAILURE, message);
    }

    public static BaseResult setBaseResult(int status, String message) {
        BaseResult baseResult = new BaseResult();
        baseResult.setStatus(status);
        baseResult.setMessage(message);
        return baseResult;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
