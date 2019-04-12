package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import java.util.Collection;
import java.util.Set;

@Entity
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    private String email;
    private String phone;

    private String firstName;
    private String middleName;
    private String lastName;

    private String address;
    private String house;
    private String room;

    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public String getFullName(){
        return firstName + " " + middleName + " " + lastName;
    }

    public boolean isAdmin(){
        return roles.contains(Role.ADMIN);
    }

    public boolean isOperator(){
        return roles.contains(Role.OPERATOR) || roles.contains(Role.ADMIN);
    }

    public boolean isDoctor(){
        return roles.contains(Role.DOCTOR) || roles.contains(Role.ADMIN);
    }

    public boolean isEmployee(){
        return roles.contains(Role.ADMIN) ||
        roles.contains(Role.OPERATOR) ||
        roles.contains(Role.DOCTOR);
    }
}
