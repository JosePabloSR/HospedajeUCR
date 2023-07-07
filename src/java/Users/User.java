/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.sql.Date;

/**
 * Represents a user in the system.
 * @author ucr
 */
public class User {
    
    private int id;
    private String userName;
    private String password;
    private String accessLevel ;
    private Date dateCreated;
    private String appAccess;
    private Date updateDate;
    
    /**
     * Constructor para nuevos usuarios;
     */
    public User() {
        this.userName ="No registrado";
        this.password = "No registrado";
        this.accessLevel = ""; // no hay un nivel de acceso definido
        this.dateCreated = null;
        this.updateDate = null;
        this.appAccess ="No registrado";
    }
    /**
     * Cuando el usuario ya esta ingresado
     * @param id
     * @param userName
     * @param password
     * @param accessLevel
     * @param dateCreated
     * @param appAccess 
     */
    public User(int id, String userName, String password, String accessLevel, Date dateCreated, String appAccess) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.accessLevel = accessLevel;
        this.dateCreated = dateCreated;
        this.appAccess = appAccess;
    }
    /**
     * Constructor for existing users with update date.
     * @param id The ID of the user.
     * @param userName The username of the user.
     * @param password The password of the user.
     * @param acLevel The access level of the user.
     * @param dateCreated The date the user was created.
     * @param appAccess The application access of the user.
     * @param dateUpdate The date the user was last updated.
     */
    public User(int id, String userName, String password, String acLevel, 
            Date dateCreated, String appAccess, Date dateUpdate) {
     this.id = id;
        this.userName = userName;
        this.password = password;
        this.accessLevel = acLevel;
        this.dateCreated = dateCreated;
        this.appAccess = appAccess;
        this.updateDate = dateUpdate;
    }

   /**
     * Get the ID of the user.
     * @return The ID of the user.
     */
    public int getId() {
        return id;
    }

    /**
     * Set the ID of the user.
     * @param id The ID to set.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get the username of the user.
     * @return The username of the user.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Set the username of the user.
     * @param userName The username to set.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Get the password of the user.
     * @return The password of the user.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the password of the user.
     * @param password The password to set.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get the access level of the user.
     * @return The access level of the user.
     */
    public String getAccessLevel() {
        return accessLevel;
    }

    /**
     * Set the access level of the user.
     * @param accessLevel The access level to set.
     */
    public void setAccessLevel(String accessLevel) {
        this.accessLevel = accessLevel;
    }

    /**
     * Get the date the user was created.
     * @return The date the user was created.
     */
    public Date getDateCreated() {
        return dateCreated;
    }

    /**
     * Set the date the user was created.
     * @param dateCreated The date to set.
     */
    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    /**
     * Get the application access of the user.
     * @return The application access of the user.
     */
    public String getAppAccess() {
        return appAccess;
    }

    /**
     * Set the application access of the user.
     * @param appAccess The application access to set.
     */
    public void setAppAccess(String appAccess) {
        this.appAccess = appAccess;
    }

    /**
     * Get the date the user was last updated.
     * @return The date the user was last updated.
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * Set the date the user was last updated.
     * @param updateDate The date to set.
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    /**
     * 
     */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("User{id=").append(id);
        sb.append(", userName=").append(userName);
        sb.append(", password=").append(password);
        sb.append(", accessLevel=").append(accessLevel);
        sb.append(", dateCreated=").append(dateCreated);
        sb.append(", appAccess=").append(appAccess);
        sb.append('}');
        return sb.toString();
    } 
}
