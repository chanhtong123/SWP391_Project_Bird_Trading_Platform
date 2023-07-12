package DTO;

public class StoreDTO {

    private String store_id;
    private String store_name;
    private String address;
    private String phone_number;
    private int user_id;
    private String image;

    public StoreDTO() {
    }

    public StoreDTO(String store_id, String store_name, String address, String phone_number, int user_id, String image) {
        this.store_id = store_id;
        this.store_name = store_name;
        this.address = address;
        this.phone_number = phone_number;
        this.user_id = user_id;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

   

}
