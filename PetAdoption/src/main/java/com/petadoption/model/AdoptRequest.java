package com.petadoption.model;

public class AdoptRequest {
    private int id;            // ← ADDED
    private String petId;
    private String petName;
    private String fullName;
    private String email;
    private String phone;
    private String reason;
    private String status;

    public AdoptRequest(String petId, String petName, String fullName, String email, String phone, String reason) {
        this.petId = petId;
        this.petName = petName;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.reason = reason;
        this.status = "Pending";
    }

    // ← ADDED
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPetId() { return petId; }

    public String getPetName() { return petName; }

    public String getFullName() { return fullName; }

    public String getEmail() { return email; }

    public String getPhone() { return phone; }

    public String getReason() { return reason; }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }
}