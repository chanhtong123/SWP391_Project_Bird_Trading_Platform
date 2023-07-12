/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.Serializable;

/**
 *
 * @author GRAM
 */
public class CreateError implements Serializable {

    private String phoneNumberIsExisted;
    private String emailIsExisted;
    private String usernameLengthError;
    private String passwordLengthError;
    private String confirmNotMatched;
    private String usernameIsExisted;
    private String usernameBlankError;
    private String passwordBlankError;
    private String wrongPasswordError;
    private String phoneFormatError;
    private String emailFormatError;
    private String emailBlankError;
    private String phoneBlankError;
    private String fullnameBlankError;
    private String notMatchPassword;
    public CreateError() {
    }

    /**
     * @return the phoneNumberIsExisted
     */
    public String getPhoneNumberIsExisted() {
        return phoneNumberIsExisted;
    }

    /**
     * @param phoneNumberIsExisted the phoneNumberIsExisted to set
     */
    public void setPhoneNumberIsExisted(String phoneNumberIsExisted) {
        this.phoneNumberIsExisted = phoneNumberIsExisted;
    }

    /**
     * @return the emailIsExisted
     */
    public String getEmailIsExisted() {
        return emailIsExisted;
    }

    /**
     * @param emailIsExisted the emailIsExisted to set
     */
    public void setEmailIsExisted(String emailIsExisted) {
        this.emailIsExisted = emailIsExisted;
    }

    /**
     * @return the usernameBlankError
     */
    public String getUsernameBlankError() {
        return usernameBlankError;
    }

    /**
     * @param usernameBlankError the usernameBlankError to set
     */
    public void setUsernameBlankError(String usernameBlankError) {
        this.usernameBlankError = usernameBlankError;
    }

    /**
     * @return the passwordBlankError
     */
    public String getPasswordBlankError() {
        return passwordBlankError;
    }

    /**
     * @param passwordBlankError the passwordBlankError to set
     */
    public void setPasswordBlankError(String passwordBlankError) {
        this.passwordBlankError = passwordBlankError;
    }

    /**
     * @return the usernameLengthError
     */
    public String getUsernameLengthError() {
        return usernameLengthError;
    }

    /**
     * @param usernameLengthError
     */
    public void setUsernameLengthError(String usernameLengthError) {
        this.usernameLengthError = usernameLengthError;
    }

    /**
     * @return the passwordLengthError
     */
    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    /**
     * @param passwordLengthError the passwordLengthError to set
     */
    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    /**
     * @return the confirmNotMatched
     */
    public String getConfirmNotMatched() {
        return confirmNotMatched;
    }

    /**
     * @param confirmNotMatched the confirmNotMatched to set
     */
    public void setConfirmNotMatched(String confirmNotMatched) {
        this.confirmNotMatched = confirmNotMatched;
    }

    /**
     * @return the usernameIsExisted
     */
    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    /**
     * @param usernameIsExisted
     */
    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }

    /**
     * @return the wrongPasswordError
     */
    public String getWrongPasswordError() {
        return wrongPasswordError;
    }

    /**
     * @param wrongPasswordError the wrongPasswordError to set
     */
    public void setWrongPasswordError(String wrongPasswordError) {
        this.wrongPasswordError = wrongPasswordError;
    }

    /**
     * @return the emailFormatError
     */
    public String getEmailFormatError() {
        return emailFormatError;
    }

    /**
     * @param emailFormatError the emailFormatError to set
     */
    public void setEmailFormatError(String emailFormatError) {
        this.emailFormatError = emailFormatError;
    }

    /**
     * @return the phoneFormatError
     */
    public String getPhoneFormatError() {
        return phoneFormatError;
    }

    /**
     * @param phoneFormatError the phoneFormatError to set
     */
    public void setPhoneFormatError(String phoneFormatError) {
        this.phoneFormatError = phoneFormatError;
    }

    /**
     * @return the emailBlankError
     */
    public String getEmailBlankError() {
        return emailBlankError;
    }

    /**
     * @param emailBlankError the emailBlankError to set
     */
    public void setEmailBlankError(String emailBlankError) {
        this.emailBlankError = emailBlankError;
    }

    /**
     * @return the phoneBlankError
     */
    public String getPhoneBlankError() {
        return phoneBlankError;
    }

    /**
     * @param phoneBlankError the phoneBlankError to set
     */
    public void setPhoneBlankError(String phoneBlankError) {
        this.phoneBlankError = phoneBlankError;
    }

    /**
     * @return the fullnameBlankError
     */
    public String getFullnameBlankError() {
        return fullnameBlankError;
    }

    /**
     * @param fullnameBlankError the fullnameBlankError to set
     */
    public void setFullnameBlankError(String fullnameBlankError) {
        this.fullnameBlankError = fullnameBlankError;
    }

    /**
     * @return the notMatchPassword
     */
    public String getNotMatchPassword() {
        return notMatchPassword;
    }

    /**
     * @param notMatchPassword the notMatchPassword to set
     */
    public void setNotMatchPassword(String notMatchPassword) {
        this.notMatchPassword = notMatchPassword;
    }

    
    
}
