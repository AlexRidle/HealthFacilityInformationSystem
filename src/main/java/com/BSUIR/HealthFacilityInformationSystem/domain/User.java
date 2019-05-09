package com.BSUIR.HealthFacilityInformationSystem.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Set;

@Entity
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Pattern(regexp = "[a-zA-Z0-9_.]*", message = "Недопустимое имя пользователя")
    @NotBlank(message = "Укажите имя пользователя")
    private String username;
    @Size(min=6, message = "Пароль должен быть не короче 6 символов")
    private String password;

    @Email(message = "Неверно указан адрес электронной почты")
    @NotBlank(message = "Необходимо указать адрес электронной почты")
    private String email;
    @NotBlank(message = "Необходимо указать номер телефона")
    @Pattern(regexp = "^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*$", message = "Недопустимый номер телефона")
    private String phone;
    @NotBlank(message = "Необходимо указать имя")
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Имя содержит недопустимые символы")
    private String firstName;
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Отчество содержит недопустимые символы")
    @NotBlank(message = "Необходимо указать отчество")
    private String middleName;
    @Pattern(regexp = "([A-Za-zА-Яа-я])\\w+", message = "Фамилия содержит недопустимые символы")
    @NotBlank(message = "Необходимо указать фамилию")
    private String lastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDate;
    @NotBlank(message = "Необходимо указать адрес")
    private String address;
    @NotBlank(message = "")
    private String house;
    @NotBlank(message = "")
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

    public boolean isOnlyDoctor(){
        return roles.contains(Role.DOCTOR);
    }

    public boolean isEmployee(){
        return roles.contains(Role.ADMIN) ||
        roles.contains(Role.OPERATOR) ||
        roles.contains(Role.DOCTOR);
    }
}
