package com.petadoption.model;

public class Pet {
    private int id;
    private String name;
    private String type;
    private String breed;
    private String age;
    private String location;
    private String description;

    public Pet() {
    }

    public Pet(int id, String name, String type, String breed, String age, String location, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.breed = breed;
        this.age = age;
        this.location = location;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }    

    public String getName() {
        if (name == null || name.length() == 0) {
            return "Unnamed Pet";
        }

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }    

    public String getType() {
        if (type == null || type.length() == 0) {
            return "Other";
        }

        return type;
    }

    public void setType(String type) {
        this.type = type;
    }    

    public String getBreed() {
        if (breed == null || breed.length() == 0) {
            return "Unknown";
        }

        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }    

    public String getAge() {
        if (age == null || age.length() == 0) {
            return "Unknown";
        }

        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }    

    public String getLocation() {
        if (location == null || location.length() == 0) {
            return "—";
        }

        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        if (description == null || description.length() == 0) {
            return "No description added.";
        }

        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}