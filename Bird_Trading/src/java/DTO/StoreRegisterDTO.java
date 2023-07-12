
package DTO;


public class StoreRegisterDTO {
    private String store_register_id;
    private String store_name;
    private String address;
    private String phone_number;
    private int user_id;

    public StoreRegisterDTO() {
    }

    
    
    public StoreRegisterDTO(String store_register_id, String store_name, String address, String phone_number, int user_id) {
        this.store_register_id = store_register_id;
        this.store_name = store_name;
        this.address = address;
        this.phone_number = phone_number;
        this.user_id = user_id;
    }

    public StoreRegisterDTO(String store_name, String address, String phone_number, int user_id) {
        this.store_name = store_name;
        this.address = address;
        this.phone_number = phone_number;
        this.user_id = user_id;
    }
    
    

    public String getStore_register_id() {
        return store_register_id;
    }

    public void setStore_register_id(String store_register_id) {
        this.store_register_id = store_register_id;
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

    @Override
    public String toString() {
        return "StoreRegisterDTO{" + "store_register_id=" + store_register_id + ", store_name=" + store_name + ", address=" + address + ", phone_number=" + phone_number + ", user_id=" + user_id + '}';
    }
    
    

}
